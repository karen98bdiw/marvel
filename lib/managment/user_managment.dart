import 'package:flutter/cupertino.dart';
import 'package:marvel/firebase_services/firebase_base.dart';

import 'package:marvel/models/api_models/api_response.dart';
import 'package:marvel/models/custom_user.dart';
import 'package:marvel/widgets/dialogs.dart';

class UserManagment extends ChangeNotifier {
  CustomUser curentUser;
  List<String> favorites;

  Future<ApiResponse<CustomUser>> signIn({
    String email,
    String password,
  }) async {
    var res = await FirebaseBase()
        .userServices
        .singIn(email: email, password: password);
    if (res.done) {
      curentUser = res.data;

      notifyListeners();
      return ApiResponse(
        done: true,
        response: res.response,
      );
    } else {
      curentUser = null;
      notifyListeners();
      showError(errorText: res.error.errorText);
      return ApiResponse(
        done: false,
        error: res.error,
      );
    }
  }

  Future<void> createUser({
    CustomUser user,
    String password,
  }) async {
    var res = await FirebaseBase().userServices.createUser(
          customUser: user,
          password: password,
        );
    if (res.done) {
      curentUser = res.data;
    } else {
      showError(errorText: res.error.errorText);
    }
  }

  Future<bool> signOut() async {
    try {
      FirebaseBase().userServices.logOut();
      curentUser = null;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addCharacterToFavorite({String characterId}) async {
    try {
      var res = await FirebaseBase()
          .userServices
          .addFovariteCharacter(characterId: characterId);
      await getFavorites();

      if (res.done) {
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      showError(errorText: e.toString());
      return false;
    }
  }

  Future<bool> removeCharacterFromFavorites({String characterId}) async {
    try {
      var res = await FirebaseBase()
          .userServices
          .removeCharacterFromFavorites(characterId: characterId);
      await getFavorites();
      if (res.done) {
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      showError(errorText: e.toString());
    }
    return false;
  }

  Future<List<String>> getFavorites({String userId}) async {
    try {
      var res = await FirebaseBase().userServices.getFavorites();
      favorites = res;

      notifyListeners();
      return res;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

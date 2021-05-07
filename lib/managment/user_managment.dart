import 'package:flutter/cupertino.dart';
import 'package:marvel/firebase_services/firebase_base.dart';
import 'package:marvel/models/custom_user.dart';
import 'package:marvel/widgets/dialogs.dart';

class UserManagment extends ChangeNotifier {
  CustomUser curentUser;

  Future<void> signIn({
    String email,
    String password,
  }) async {
    var res = await FirebaseBase()
        .userServices
        .singIn(email: email, password: password);
    if (res.done) {
      curentUser = res.data;
      notifyListeners();
    } else {
      curentUser = null;
      notifyListeners();
      showError(errorText: res.error.errorText);
    }

    return false;
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
}

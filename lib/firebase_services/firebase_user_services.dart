import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marvel/firebase_services/service_constats.dart';
import 'package:marvel/models/api_models/api_error.dart';
import 'package:marvel/models/api_models/api_error_constats.dart';
import 'package:marvel/models/api_models/api_response.dart';
import 'package:marvel/models/custom_user.dart';

class FirebaseUserServices {
  final FirebaseAuth auth;
  final FirebaseFirestore store;

  FirebaseUserServices({this.auth, this.store});

  Future<ApiResponse<CustomUser>> createUser({
    CustomUser customUser,
    String password,
  }) async {
    try {
      var res = await auth.createUserWithEmailAndPassword(
          email: customUser.email, password: password);
      if (res.user != null) {
        customUser.id = res.user.uid;
        var postingResponse = await postUser(user: customUser);

        if (postingResponse.done)
          return ApiResponse(done: true, response: customUser);
      }

      return ApiResponse(
        done: false,
        error: ApiError(errorText: ApiErrorConstats.Internale_Error),
      );
    } catch (e) {
      return ApiResponse(
        done: false,
        error: ApiError(
          errorText: e.toString(),
        ),
      );
    }
  }

  Future<ApiResponse<CustomUser>> postUser({CustomUser user}) async {
    try {
      store
          .collection(FirebaseServiceConstats.Users_Colection_Path)
          .doc(user.id)
          .set(user.toJson());
      return ApiResponse(
        done: true,
        response: user,
      );
    } catch (e) {
      return ApiResponse(
        done: false,
        error: ApiError(
          errorText: e.toString(),
        ),
      );
    }
  }

  Future<ApiResponse<CustomUser>> singIn({
    String email,
    String password,
  }) async {
    try {
      var res = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (res.user != null) {
        var userDataRes = await getUserData(
          userId: res.user.uid,
        );

        if (userDataRes.done)
          return ApiResponse(
            done: true,
            response: userDataRes.response,
          );

        return ApiResponse(
          done: false,
          error: userDataRes.error,
        );
      }

      return ApiResponse(
        done: false,
        error: ApiError(errorText: ApiErrorConstats.Internale_Error),
      );
    } catch (e) {
      return ApiResponse(
        error: ApiError(
          errorText: e.toString(),
        ),
        done: false,
      );
    }
  }

  Future<ApiResponse<CustomUser>> getUserData({String userId}) async {
    try {
      var res = await store
          .collection(FirebaseServiceConstats.Users_Colection_Path)
          .doc(userId)
          .get();
      if (res.exists)
        return ApiResponse(
          done: true,
          response: res.data(),
        );

      return ApiResponse(
        done: false,
        error: ApiError(
          errorText: ApiErrorConstats.User_Not_Exist,
        ),
      );
    } catch (e) {
      return ApiResponse(
        done: false,
        error: ApiError(
          errorText: e.toString(),
        ),
      );
    }
  }

  Future<ApiResponse<String>> addFovariteCharacter({String characterId}) async {
    try {
      await store
          .collection(FirebaseServiceConstats.Users_Colection_Path)
          .doc(auth.currentUser.uid)
          .collection(FirebaseServiceConstats.Favorite_Colections_Path)
          .doc(characterId)
          .set({"id": characterId});
      return ApiResponse(
        done: true,
      );
    } catch (e) {
      return ApiResponse(
        done: false,
        error: ApiError(
          errorText: e.toString(),
        ),
      );
    }
  }

  Future<ApiResponse<String>> removeCharacterFromFavorites(
      {String characterId}) async {
    try {
      await store
          .collection(FirebaseServiceConstats.Users_Colection_Path)
          .doc(auth.currentUser.uid)
          .collection(FirebaseServiceConstats.Favorite_Colections_Path)
          .doc(characterId)
          .delete();
      return ApiResponse(
        done: true,
      );
    } catch (e) {
      return ApiResponse(
        done: false,
      );
    }
  }

  getFavorites({String userId}) async {
    List<String> favs = [];

    var res = await store
        .collection(FirebaseServiceConstats.Users_Colection_Path)
        .doc(auth.currentUser.uid)
        .collection(FirebaseServiceConstats.Favorite_Colections_Path)
        .get();
    res.docs.forEach((element) {
      favs.add(
        element.data()["id"].toString(),
      );
    });
    return favs;
  }

  Future<bool> logOut() async {
    try {
      await auth.signOut();
      return false;
    } catch (e) {
      return false;
    }
  }
}

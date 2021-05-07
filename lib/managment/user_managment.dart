import 'package:flutter/cupertino.dart';
import 'package:marvel/firebase_services/firebase_base.dart';
import 'package:marvel/firebase_services/firebase_user_services.dart';
import 'package:marvel/models/custom_user.dart';

class UserManagment extends ChangeNotifier {
  CustomUser customUser;

  Future<void> signIn({
    String email,
    String password,
  }) async {
    var res = await FirebaseBase()
        .userServices
        .singIn(email: email, password: password);
    if (res.done) {
      customUser = res.data;
    }

    return false;
  }
}

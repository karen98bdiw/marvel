import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserServices {
  final FirebaseAuth auth;
  final FirebaseFirestore store;

  FirebaseUserServices({this.auth, this.store});

  // Future<ApiResponse<CustomUser>> createUser({
  //   CustomUser customUser,
  //   String password,
  // }) async {
  //   try{}catch(e){
  //     return
  //   }
  // }
}

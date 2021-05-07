import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marvel/firebase_services/firebase_user_services.dart';

class FirebaseBase {
  FirebaseBase._interanal();

  static final FirebaseBase firebaseBase = FirebaseBase._interanal();

  factory FirebaseBase() => firebaseBase;

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseUserServices userServices = FirebaseUserServices(
    auth: _auth,
    store: _firestore,
  );
}

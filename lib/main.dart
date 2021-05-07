import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel/marvel_app.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SharedPreferences.getInstance().then((prefs) {
    runApp(
      MarvelApp(),
    );
  });
}

Future<void> main() async {
  await run();
}

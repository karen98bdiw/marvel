import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }

  var darkThem = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    accentColorBrightness: Brightness.light,
    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          fontFamily: "OpenSans",
          fontStyle: FontStyle.normal,
          color: Colors.white,
        ),
        headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: "OpenSans",
            fontStyle: FontStyle.normal,
            color: Colors.white),
        headline3: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: "OpenSans",
            fontStyle: FontStyle.normal,
            color: Colors.white),
        headline4: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: "OpenSans",
            fontStyle: FontStyle.normal,
            color: Colors.white),
        headline5: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            fontFamily: "OpenSans",
            fontStyle: FontStyle.normal,
            color: Colors.white)),
    buttonColor: Color.fromRGBO(255, 255, 255, 0.3),
  );

  var lightThem = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    accentColorBrightness: Brightness.light,
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            fontFamily: "OpenSans",
            fontStyle: FontStyle.normal,
            color: Colors.white),
        headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: "OpenSans",
            fontStyle: FontStyle.normal,
            color: Colors.black),
        headline3: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: "OpenSans",
            fontStyle: FontStyle.normal,
            color: Colors.black),
        headline4: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: "OpenSans",
            fontStyle: FontStyle.normal,
            color: Colors.black),
        headline5: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            fontFamily: "OpenSans",
            fontStyle: FontStyle.normal,
            color: Colors.black)),
    buttonColor: Color.fromRGBO(255, 255, 255, 0.3),
  );
}

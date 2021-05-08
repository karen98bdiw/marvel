import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  static final routeName = "FavoritesPage";

  FavoritesPage({Key key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("sa,jdjksa"),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}

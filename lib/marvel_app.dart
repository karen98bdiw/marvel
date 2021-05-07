import 'package:flutter/material.dart';
import 'package:marvel/pages/home_page.dart';

class MarvelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (c) => HomePage(),
      },
    );
  }
}

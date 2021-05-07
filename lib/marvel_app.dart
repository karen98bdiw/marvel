import 'package:flutter/material.dart';
import 'package:marvel/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:marvel/pages/sign_in_page.dart';
import 'package:marvel/pages/sign_up_page.dart';

import 'utils/theme_data.dart';

class MarvelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
        create: (c) => ThemeNotifier(),
        builder: (c, w) {
          final themeNotifier = Provider.of<ThemeNotifier>(c);
          print(themeNotifier.getTheme());
          return MaterialApp(
            initialRoute: HomePage.routeName,
            theme: themeNotifier.getTheme() == null
                ? themeNotifier.darkThem
                : themeNotifier.getTheme(),
            routes: {
              HomePage.routeName: (c) => HomePage(),
              SignInPage.routeName: (c) => SignInPage(),
              SignUpPage.routeName: (c) => SignUpPage(),
            },
          );
        });
  }
}

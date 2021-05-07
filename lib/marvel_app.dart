import 'package:flutter/material.dart';
import 'package:marvel/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'utils/theme_data.dart';
import 'utils/theme_data.dart';
import 'utils/theme_data.dart';

class MarvelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (c) => ThemeNotifier(),
        builder: (c, w) {
          final themeNotifier = Provider.of<ThemeNotifier>(context);

          return MaterialApp(
            initialRoute: HomePage.routeName,
            theme: themeNotifier.getTheme(),
            routes: {
              HomePage.routeName: (c) => HomePage(),
            },
          );
        });
  }
}

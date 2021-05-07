import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:marvel/l10n/l10n.dart';
import 'package:marvel/managment/character_mangment.dart';
import 'package:marvel/managment/locale_managment.dart';
import 'package:marvel/managment/user_managment.dart';
import 'package:marvel/pages/home_page.dart';
import 'package:marvel/utils/global_keys.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MarvelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (c) => LocaleManagment(),
      builder: (
        c,
        w,
      ) {
        LocaleManagment localeManagment = Provider.of<LocaleManagment>(c);
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (c) => UserManagment()),
            ChangeNotifierProvider(create: (c) => CharacterManagment()),
          ],
          child: MaterialApp(
            locale: localeManagment.locale != null
                ? localeManagment.locale
                : Locale("en"),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            navigatorKey: GlobalKeys.navigatorKey,
            initialRoute: HomePage.routeName,
            routes: {
              HomePage.routeName: (c) => HomePage(),
            },
          ),
        );
      },
    );
  }
}

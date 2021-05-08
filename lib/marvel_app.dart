import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:marvel/l10n/l10n.dart';
import 'package:marvel/managment/character_mangment.dart';
import 'package:marvel/managment/locale_managment.dart';
import 'package:marvel/managment/user_managment.dart';
import 'package:marvel/pages/home_page.dart';
import 'package:marvel/pages/on_board.dart';
import 'package:marvel/pages/sign_in_page.dart';
import 'package:marvel/pages/sign_up_page.dart';
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
        return Consumer<LocaleManagment>(builder: (c, ch, w) {
          print(ch.locale);
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (c) => UserManagment()),
              ChangeNotifierProvider(create: (c) => CharacterManagment()),
            ],
            child: MaterialApp(
              locale: ch.locale != null ? ch.locale : Locale("hy"),
              // theme: themeNotifier.getTheme() == null
              //     ? themeNotifier.darkThem
              //     : themeNotifier.getTheme(),
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: L10n.all,
              navigatorKey: GlobalKeys.navigatorKey,
              initialRoute: OnBoard.routeName,
              routes: {
                OnBoard.routeName: (c) => OnBoard(),
                HomePage.routeName: (c) => HomePage(),
                SignInPage.routeName: (c) => SignInPage(),
                SignUpPage.routeName: (c) => SignUpPage(),
              },
            ),
          );
        });
      },
    );
  }
}

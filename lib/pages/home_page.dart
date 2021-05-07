import 'package:flutter/material.dart';
import 'package:marvel/managment/locale_managment.dart';
import 'package:marvel/managment/user_managment.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  static final routeName = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserManagment userManagment;
  LocaleManagment localeManagment;

  @override
  void initState() {
    localeManagment = Provider.of<LocaleManagment>(context, listen: false);
    userManagment = Provider.of<UserManagment>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text(AppLocalizations.of(context).language),
        Row(
          children: [
            Expanded(
              child: RaisedButton(
                child: Text("Armenian"),
                onPressed: () {
                  localeManagment.setLocale(
                    Locale("hy"),
                  );
                },
              ),
            ),
            Expanded(
              child: RaisedButton(
                child: Text("English"),
                onPressed: () {
                  localeManagment.setLocale(Locale("en"));
                },
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

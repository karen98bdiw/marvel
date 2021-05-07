import 'package:flutter/material.dart';
import 'package:marvel/managment/character_mangment.dart';
import 'package:marvel/managment/locale_managment.dart';
import 'package:marvel/managment/user_managment.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final routeName = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserManagment userManagment;
  LocaleManagment localeManagment;
  CharacterManagment characterManagment;
  @override
  void initState() {
    localeManagment = Provider.of<LocaleManagment>(context, listen: false);
    userManagment = Provider.of<UserManagment>(context, listen: false);
    characterManagment =
        Provider.of<CharacterManagment>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    characterManagment.getCharacterById(id: "1011334");
    return Scaffold(
        body: Column(
      children: [
        Consumer<CharacterManagment>(
            builder: (c, ch, w) => Container(
                  child: Text(
                    ch.characterData != null ? ch.characterData.name : "null",
                  ),
                )),
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

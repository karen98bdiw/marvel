import 'package:flutter/material.dart';
import 'package:marvel/managment/character_mangment.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'inpurs.dart';

class AppBarSliver extends StatefulWidget {
  static final GlobalKey<_AppBarSliverState> appBarState =
      GlobalKey<_AppBarSliverState>();

  AppBarSliver({Key key}) : super(key: key);

  @override
  _AppBarSliverState createState() => _AppBarSliverState();
}

class _AppBarSliverState extends State<AppBarSliver> {
  CharacterManagment characterManagment;
  TextEditingController controller = TextEditingController();

  onSave(v) {
    characterManagment.getCharacterByName(name: v);
  }

  @override
  Widget build(BuildContext context) {
    characterManagment = Provider.of<CharacterManagment>(context);
    return Container(
      height: 120,
      decoration: BoxDecoration(color: Colors.black),
      child: Container(
        margin: EdgeInsets.only(top: 70, left: 10, right: 10),
        child: Container(
            child: CustomFormInput(
                onChanged: (v) {
                  onSave(v);
                },
                controller: controller,
                prefix: Icons.search,
                hintText: AppLocalizations.of(context).search,
                obscureText: false)),
      ),
    );
  }
}

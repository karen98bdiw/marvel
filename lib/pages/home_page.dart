import 'package:flutter/material.dart';
import 'package:marvel/pages/all_charactars.dart';
import 'package:marvel/pages/favorite_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  static final routeName = "HomePageUser";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: sectionIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              label: AppLocalizations.of(context).home, icon: Icon(Icons.menu)),
          BottomNavigationBarItem(
              label: AppLocalizations.of(context).favorite,
              icon: Icon(Icons.favorite)),
        ],
        onTap: (index) {
          setState(() {
            sectionIndex = index;
          });
        },
      ),
      body: Container(
        child: _body(),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back.png"),
                fit: BoxFit.cover)),
      ),
    );
  }

  Widget _body() {
    switch (sectionIndex) {
      case 0:
        return AllCharactersPage();
        break;
      case 1:
        return FavoritesPage();
        break;
      default:
        return AllCharactersPage();
    }
  }
}

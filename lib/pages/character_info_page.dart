import 'package:flutter/material.dart';
import 'package:marvel/managment/character_mangment.dart';
import 'package:marvel/pages/home_page.dart';
import 'package:provider/provider.dart';

class CharacterInfoPage extends StatefulWidget {
  final String characterId;
  static final routeName = "CharacterInfoPage";
  CharacterInfoPage({Key key, this.characterId}) : super(key: key);

  @override
  _CharacterInfoPageState createState() => _CharacterInfoPageState();
}

class _CharacterInfoPageState extends State<CharacterInfoPage> {
  CharacterManagment characterManagment;

  @override
  void initState() {
    characterManagment =
        Provider.of<CharacterManagment>(context, listen: false);
    characterManagment.getCharacterById(id: widget.characterId);

    super.initState();
  }

  @override
  void dispose() {
    characterManagment.characterData = null; //?
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<CharacterManagment>(
          builder: (c, ch, w) =>
              ch.characterData != null ? _body() : Text("not found"),
        ),
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
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(bottom: 100),
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(characterManagment
                              .characterData.thumbnail.imageUrl),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 15,
                      top: MediaQuery.of(context).size.height * 0.45,
                      bottom: 15),
                  child: Text(characterManagment.characterData.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 15, bottom: 15),
              child: Text("Storyline",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal)),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(characterManagment.characterData.description,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal)),
            ),
          ],
        ),
        Positioned(
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomePage.routeName);
                },
              ),
              Text(
                "Back",
                style: TextStyle(color: Colors.white, fontSize: 24),
              )
            ],
          ),
          top: 30,
          left: 10,
        )
      ],
    );
  }
}

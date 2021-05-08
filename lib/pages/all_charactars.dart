import 'package:flutter/material.dart';
import 'package:marvel/managment/character_mangment.dart';
import 'package:marvel/managment/user_managment.dart';
import 'package:marvel/pages/character_info_page.dart';
import 'package:marvel/widgets/character_card.dart';
import 'package:marvel/widgets/sliverbar.dart';
import 'package:provider/provider.dart';

class AllCharactersPage extends StatefulWidget {
  static final routeName = "AllCharactersPage";

  AllCharactersPage({Key key}) : super(key: key);

  @override
  _AllCharactersPageState createState() => _AllCharactersPageState();
}

class _AllCharactersPageState extends State<AllCharactersPage> {
  CharacterManagment characterManagment;
  UserManagment userManagment;

  @override
  void initState() {
    characterManagment =
        Provider.of<CharacterManagment>(context, listen: false);
    userManagment = Provider.of<UserManagment>(context, listen: false);
    characterManagment.getAllCharacters();
    userManagment.getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
              title: Consumer<UserManagment>(
                  builder: (c, ch, w) => Text(
                        "Good morning ${ch.curentUser.nickName}",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
              backgroundColor: Colors.black,
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 120.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: AppBarSliver()),
                  ],
                ),
              )),
        ];
      },
      body: Container(
        child: Consumer<CharacterManagment>(
          builder: (c, ch, w) =>
              ch.allCharacters != null ? _body() : Text("not fount"),
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back.png"),
                fit: BoxFit.cover)),
      ),
    ));
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
            childAspectRatio: 0.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: characterManagment.allCharacters.length,
        itemBuilder: (context, index) {
          return Container(
            child: Consumer<UserManagment>(
              builder: (c, ch, w) {
                var isFav = ch.favorites == null
                    ? false
                    : ch.favorites.contains(
                        characterManagment.allCharacters[index].id.toString());
                return CharacterCard(
                    isFav: isFav,
                    onFavClick: (v) async {
                      if (v) {
                        await userManagment.addCharacterToFavorite(
                            characterId: characterManagment
                                .allCharacters[index].id
                                .toString());
                      } else {
                        await userManagment.removeCharacterFromFavorites(
                            characterId: characterManagment
                                .allCharacters[index].id
                                .toString());
                      }
                    },
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) => CharacterInfoPage(
                                characterId: characterManagment
                                    .allCharacters[index].id
                                    .toString(),
                              )));
                    },
                    name: characterManagment.allCharacters[index].name,
                    image: characterManagment
                        .allCharacters[index].thumbnail.imageUrl);
              },
            ),
          );
        },
      ),
    );
  }
}

class CardItem {
  String name;
  String image;
  CardItem({this.name, this.image});
}

import 'package:flutter/material.dart';
import 'package:marvel/widgets/favorite_icon.dart';

class CharacterCard extends StatelessWidget {
  final ValueChanged<bool> onFavClick;
  final String name;
  final String image;
  final Function onTap;
  final bool isFav;
  CharacterCard(
      {this.name, this.image, this.onTap, this.isFav, this.onFavClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(children: [
          Flexible(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: FavIcon(
                      value: isFav,
                      onTap: onFavClick,
                    ))
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                // softWrap: false,
                style: TextStyle(color: Colors.grey, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

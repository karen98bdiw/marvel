import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(favorite ? Icons.favorite_outline : Icons.favorite),
        iconSize: 35,
        color: favorite ? Colors.white : Colors.red,
        onPressed: () {
          setState(() {
            favorite = !favorite;
          });
        });
  }
}

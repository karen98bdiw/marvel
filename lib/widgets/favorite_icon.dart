import 'package:flutter/material.dart';

class FavIcon extends StatefulWidget {
  final ValueChanged<bool> onTap;
  final bool value;

  FavIcon({this.onTap, this.value});

  @override
  _FavIconState createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool isFav;
  @override
  void initState() {
    isFav = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
          iconSize: 35,
          onPressed: () {
            setState(() {
              isFav = !isFav;
              widget.onTap(isFav);
            });
          },
          icon: Icon(isFav ? Icons.favorite : Icons.favorite_outline),
          color: isFav ? Colors.red : Colors.white),
    );
  }
}

import 'package:flutter/material.dart';

import 'custom_favorite_icon.dart';

class CharacterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.network(
              "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dw.com%2Fru%2F%25D0%25BA%25D1%2583%25D0%25BB%25D1%258C%25D1%2582%25D0%25BE%25D0%25B2%25D1%258B%25D0%25B5-%25D0%25B7%25D0%25B2%25D0%25B5%25D0%25B7%25D0%25B4%25D1%258B-%25D0%25B6%25D0%25B8%25D0%25B2%25D0%25BE%25D1%2582%25D0%25BD%25D0%25BE%25D0%25B3%25D0%25BE-%25D0%25BC%25D0%25B8%25D1%2580%25D0%25B0-%25D1%2584%25D0%25BE%25D1%2582%25D0%25BE%2Fa-18581755&psig=AOvVaw2vuYYqat6uImdDN0Ji7eU0&ust=1620462794058000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPiXxr6Ut_ACFQAAAAAdAAAAABAP"),
        ),
        FavoriteIcon()
      ],
    );
  }
}

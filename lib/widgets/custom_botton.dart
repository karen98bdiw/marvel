import 'package:flutter/material.dart';

class CutomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color buttonColor;
  final double width;
  final double height;
  CutomButton(
      {this.text, this.onTap, this.buttonColor, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              side: BorderSide(
                color: Colors.white,
              ),
              primary: buttonColor),
          child: Text(text),
          onPressed: onTap),
    );
  }
}

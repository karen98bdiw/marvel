import 'package:flutter/material.dart';

class CutomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color buttonColor;
  bool fill;
  CutomButton({
    this.text,
    this.onTap,
    this.buttonColor,
    this.fill = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40, top: 45),
      width: fill ? MediaQuery.of(context).size.width * 0.6 : double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              side: BorderSide(
                color: Colors.white,
              ),
              primary: buttonColor),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline4,
          ),
          onPressed: onTap),
    );
  }
}

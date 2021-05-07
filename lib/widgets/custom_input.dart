import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final IconData prefix;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType type;
  final double fontSize;
  final double iconSize;
  final Color enableColor;
  final Color focusedColor;

  CustomInput(
      {this.hintText,
      this.prefix,
      this.onSaved,
      this.validator,
      this.controller,
      this.obscureText = false,
      this.type,
      this.fontSize,
      this.iconSize,
      this.enableColor,
      this.focusedColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 20),
      child: TextFormField(
        keyboardType: type,
        validator: validator,
        onSaved: onSaved,
        cursorColor: Colors.white,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(7),
            prefixIcon: Icon(
              prefix,
              color: Colors.white,
              size: iconSize,
            ),
            isDense: true,
            filled: true,
            // fillColor: Colors.white.withOpacity(0.1),
            // border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(20),
            //     borderSide: BorderSide.none
            //     ),
            // focusColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: Theme.of(context).textTheme.headline5

            // focusedBorder: OutlineInputBorder(
            //     // borderRadius: BorderRadius.all(Radius.circular(50)),
            //     borderSide: BorderSide(color: focusedColor.withOpacity(1)
            //     )
            //     ),
            // enabledBorder: OutlineInputBorder(
            //     // borderRadius: BorderRadius.all(Radius.circular(50)),
            //     borderSide: BorderSide(color: enableColor.withOpacity(1))
            //     ),
            ),
      ),
    );
  }
}

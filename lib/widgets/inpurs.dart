import 'package:flutter/material.dart';
import 'package:marvel/widgets/style_color.dart';

class CustomFormInput extends StatelessWidget {
  final String hintText;
  final IconData prefix;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final bool obscureText;

  CustomFormInput({
    this.onChanged,
    this.hintText,
    this.prefix,
    this.onSaved,
    this.validator,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,
      onSaved: onSaved,
      validator: validator,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: inputBorderColor2),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white, height: 1),
          prefixIcon: Icon(
            prefix,
            size: 22,
            color: Colors.white,
          )),
    );
  }
}

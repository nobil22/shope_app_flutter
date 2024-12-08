import 'package:flutter/material.dart';

class CustomTextfild extends StatelessWidget {
  CustomTextfild(
      {this.onChanged,
      this.inputType,
      this.hinttext,
      this.obsecuertext = false});
  String? hinttext;
  TextInputType? inputType;
  Function(String)? onChanged;
  bool? obsecuertext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecuertext!,
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        hintText: hinttext,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

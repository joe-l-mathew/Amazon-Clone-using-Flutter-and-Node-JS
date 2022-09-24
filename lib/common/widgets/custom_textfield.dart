import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPass;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isPass = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPass,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
      validator: (value) {},
    );
  }
}

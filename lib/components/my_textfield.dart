import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield(
      {super.key,
      required this.hintText,
      this.obsecureText = false,
      required this.controller,
      required this.labelText});

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      obscureText: obsecureText,
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(Co)),
    );
  }
}

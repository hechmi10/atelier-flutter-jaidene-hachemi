import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInputDecoration extends StatelessWidget {
  String labelText;
  String hintText;
  IconData? icon;
  CustomInputDecoration(this.labelText, this.hintText, this.icon, {super.key});
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  InputDecoration customInputDecoration() {
    return InputDecoration(
      label: Text(labelText),
      hintText: hintText,
      prefixIcon: icon != null ? Icon(icon) : null,
    );
  }
}

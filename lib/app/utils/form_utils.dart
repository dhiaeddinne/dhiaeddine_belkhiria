import 'package:flutter/material.dart';

// SignIn
InputBorder customSignInInputBorder(Color color) {
  return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(2));
}

InputBorder inInputBorderColor(BuildContext context) {
  return customSignInInputBorder(Colors.white);
}

InputBorder redSignInInputBorder(BuildContext context) {
  return customSignInInputBorder(Colors.red);
}

InputBorder orangeSignInInputBorder(BuildContext context) {
  return customSignInInputBorder(Theme.of(context).primaryColor);
}

// old
UnderlineInputBorder customInputBorder(Color color) {
  return UnderlineInputBorder(borderSide: BorderSide(color: color, width: 2));
}

UnderlineInputBorder greyDisabledInputBorder(BuildContext context) {
  return customInputBorder(Theme.of(context).hoverColor);
}

UnderlineInputBorder darkGreyInputBorder(BuildContext context) {
  return customInputBorder(Theme.of(context).primaryColorDark);
}

UnderlineInputBorder redInputBorder(BuildContext context) {
  return customInputBorder(Colors.red);
}

UnderlineInputBorder orangeInputBorder(BuildContext context) {
  return customInputBorder(Theme.of(context).primaryColor);
}

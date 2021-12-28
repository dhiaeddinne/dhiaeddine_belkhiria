import 'package:flutter/material.dart';
import 'package:dhiaeddine_belkhiria/app//globalization/globalizationManager.dart';

class EmailValidator {
  static String? validateEmail(BuildContext context, value) {
    if (value.isEmpty) {
      return GlobalizationManager.of(context)
          .getMessage("validationErrors", "requiredField");
    }

    String strValue = value.toString();

    RegExp emailPattern = RegExp(
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\$");

    if (!emailPattern.hasMatch(strValue)) {
      return GlobalizationManager.of(context)
          .getMessage("validationErrors", "invalidEmail");
    }

    return null;
  }

  static String? validateConfirmEmail(
      BuildContext context, value, String email) {
    if (value.isEmpty) {
      return GlobalizationManager.of(context)
          .getMessage("validationErrors", "requiredField");
    }

    String strValue = value.toString();

    if (strValue != email) {
      return GlobalizationManager.of(context).getMessage(
          "validationErrors", "differentConfirmEmail");
    }

    return null;
  }
}

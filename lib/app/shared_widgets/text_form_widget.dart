import 'package:dhiaeddine_belkhiria/app/globalization/globalizationManager.dart';
import 'package:dhiaeddine_belkhiria/app/utils/form_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? validator;
  final Widget? suffixIcon;
  final Function? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  CustomTextFormField(
      {this.validator,
        this.hintText,
        this.suffixIcon,
        required this.label,
        this.onFieldSubmitted,
        this.focusNode, this.controller,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 66,
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        autofocus: false,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (value) => validator,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
            label: Text(label
                .toUpperCase()),
            labelStyle: const TextStyle(
              color: Colors.white38,
            ),
            hintStyle: const TextStyle(
              color: Colors.white38,
            ),
            hintText: hintText,
            enabledBorder: inInputBorderColor(context),
            focusedBorder: inInputBorderColor(context),
            errorBorder: redSignInInputBorder(context),
            focusedErrorBorder: redSignInInputBorder(context),
            errorStyle: const TextStyle(fontSize: 12)),
        onFieldSubmitted: (value) {
          focusNode?.unfocus();
        },
      ),
    );
  }
}

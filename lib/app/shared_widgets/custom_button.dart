import 'package:dhiaeddine_belkhiria/app/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final Color? btnColor;
  final Color? textColor;
  final Function onTapFunction;

  CustomButton({
    this.btnColor,
    this.textColor,
    required this.text,
    this.height,
    required this.onTapFunction,
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        height: height ?? 55,
        color: btnColor,
        child: Center(
          child: CustomText(
            text: text,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String text;
  final double? height;
  final Color? btnColor;
  final Color? textColor;
  final Widget btnIcon;
  final Function onTapFunction;

  CustomIconButton({
    this.btnColor,
    this.textColor,
    required this.text,
    this.height,
    required this.btnIcon,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        height: height ?? 55,
        color: btnColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btnIcon,
            const SizedBox(
              width: 12,
            ),
            CustomText(
              text: text,
              color: textColor ?? Colors.white,
            ),
          ],
        )
      ),
    );
  }
}

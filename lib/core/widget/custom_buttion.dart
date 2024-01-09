import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../resources/fonts.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.borderRadius, required this.textColor, required this.backgroundColor, required this.onPressed}) : super(key: key);
final String text;
final Color textColor;
final Color backgroundColor;
final BorderRadius borderRadius;
final Function()onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:7.h,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius:    borderRadius

            )
          ),
          child: CustomText(
            text: text,
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeightManager.bold,
          )),
    );
  }
}

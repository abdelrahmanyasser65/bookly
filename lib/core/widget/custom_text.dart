import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text, this.textAlign, this.fontSize, this.fontWeight, this.color, this.textStyle, this.maxLines, this.fontFamily}) : super(key: key);
 final String text;
 final TextAlign ?textAlign;
 final double ?fontSize;
 final FontWeight ?fontWeight;
 final Color ?color;
 final TextStyle?textStyle;
 final int ?maxLines;
 final String?fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
        style: textStyle??TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          fontFamily: fontFamily
        ),
      maxLines: maxLines,

    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../resources/fonts.dart';
class CustomError extends StatelessWidget {
  const CustomError({Key? key, required this.errorMessage}) : super(key: key);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:2.h
      ),
      child: Text(errorMessage,
        style: TextStyles.textStyle16,
        textAlign: TextAlign.center,
      ),
    );
  }
}

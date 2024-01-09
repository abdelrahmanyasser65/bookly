import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:abookly/core/resources/colors.dart';
import 'package:abookly/core/resources/fonts.dart';
import 'package:abookly/core/widget/custom_text.dart';
class BookRating extends StatelessWidget {
  const BookRating({Key? key, required this.rating, required this.count}) : super(key: key);
  final int rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: ColorManager.starColor,
          size: 2.5.h,
        ),
       SizedBox(width: 1.h,),
        CustomText(
          text: "$rating",
          fontSize: 16,
             fontWeight: FontWeightManager.medium,
        ),
        SizedBox(width: 0.8.h,),
        CustomText(
          text: "($count)",
          fontSize: 14,
          fontWeight: FontWeightManager.medium,
          color: ColorManager.grey,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:abookly/core/resources/colors.dart';
import 'package:abookly/core/resources/constants.dart';
import 'package:abookly/core/resources/fonts.dart';
import 'package:abookly/core/widget/custom_text.dart';
import 'package:abookly/features/home/data/models/book_models/Books_model.dart';
import 'package:abookly/features/home/presentation/views/widget/book_details/action_button.dart';
import 'package:abookly/features/home/presentation/views/widget/book_details/similar_book_list_view.dart';
import 'package:abookly/features/home/presentation/views/widget/home/custom_list_view_item.dart';

import '../home/best_seller/book_rating.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.booksModel}) : super(key: key);
  final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 3.h),
            child:  CustomListViewItem(
              imageUrl:booksModel.volumeInfo!.imageLinks?.thumbnail??"",
            ),
          ),
          CustomText(
            text: booksModel.volumeInfo!.title!,
            fontSize: 26,
            fontFamily: AppConstants.kGtSectraFine,
            fontWeight: FontWeightManager.semiBold,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 1.h,
          ),
          CustomText(
            text: booksModel.volumeInfo!.authors![0],
            fontSize: 16,
            color: ColorManager.grey,
            fontWeight: FontWeightManager.medium,
          ),
          SizedBox(
            height: 1.5.h,
          ),
          BookRating(
            rating: booksModel.volumeInfo!.averageRating!,
            count: booksModel.volumeInfo!.ratingsCount!,
          ),
          SizedBox(
            height: 3.h,
          ),
           ActionButton(
            booksModel: booksModel,
          ),
          SizedBox(
            height: 4.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: "You can also like",
              fontSize: 14.sp,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          const SimilarBookListView()
        ],
      ),
    );
  }
}

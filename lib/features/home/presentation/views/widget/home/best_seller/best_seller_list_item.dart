import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:abookly/core/resources/colors.dart';
import 'package:abookly/core/resources/fonts.dart';
import 'package:abookly/core/widget/custom_text.dart';
import 'package:abookly/features/home/data/models/book_models/Books_model.dart';


import '../../../../../../../core/resources/constants.dart';
import '../custom_list_view_item.dart';
import 'book_rating.dart';

// import 'package:abookly/core/resources/images.dart';

class BestSellerListItem extends StatelessWidget {
  const BestSellerListItem({Key? key, required this.booksModel}) : super(key: key);
  final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 18.h,
          child:CustomListViewItem(
            imageUrl: booksModel.volumeInfo!.imageLinks!.thumbnail!,
          ),
        ),
        SizedBox(
          width: 2.h,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 30.h,
                child: CustomText(
                  fontFamily: AppConstants.kGtSectraFine,
                  text: booksModel.volumeInfo!.title!,
                  fontSize: 20,
                  fontWeight: FontWeightManager.medium,
                  maxLines: 2,

                ),
              ),
              SizedBox(height: 1.h,),
              CustomText(text: booksModel.volumeInfo!.authors![0],
              fontSize: 14,
                fontWeight: FontWeightManager.medium,
                color: ColorManager.grey,
              ),
              SizedBox(height: 2.h,),
              Row(
                children: [
               const   CustomText(
                    text: "free",
                    fontWeight: FontWeightManager.bold,
                      fontSize: 20,
                  ),
                 const Spacer(),
                  BookRating(
                    rating:booksModel.volumeInfo!.averageRating! ,
                    count: booksModel.volumeInfo!.ratingsCount!,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

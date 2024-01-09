import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/fonts.dart';
import '../../../../../../core/widget/custom_text.dart';
import 'best_seller/best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_book_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        CustomScrollView(
          physics:const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const  CustomAppBar(),
                  const CustomBookListView(),

                  Padding(
                    padding: EdgeInsets.all(
                        3.h
                    ),
                    child: CustomText(
                      text: "Best Seller",
                      textStyle: TextStyles.textStyle20,
                    ),
                  ),



                ],
              ),
            ),
          const  SliverToBoxAdapter(
              child:   BestSellerListView()
            )
          ],
        );
  }
}


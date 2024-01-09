import 'package:abookly/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/resources/fonts.dart';
import '../../../../../core/widget/custom_text.dart';
import 'custom_search_text_filed.dart';
class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 3.h
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const  CustomSearchTextField(),
          SizedBox(height:1.h,),
          CustomText(
            text: "Search Result",
            textStyle: TextStyles.textStyle20,
          ),
          SizedBox(height:1.h,),
        const  Expanded(child: SearchResultListView())
        ],

      ),
    );
  }
}




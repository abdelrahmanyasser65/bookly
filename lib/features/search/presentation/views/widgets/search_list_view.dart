import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
          bottom: 2.h

      ),
      itemCount: 10,
      itemBuilder: (context,index){
        return  Padding(
          padding: EdgeInsets.only(
              top: 2.h
          ),
         // child: BestSellerListItem(),

        );
      },
    );
  }
}

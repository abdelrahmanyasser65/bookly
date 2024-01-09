import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:abookly/core/resources/app_router.dart';
import 'package:abookly/core/widget/custom_error_widget.dart';
import 'package:abookly/core/widget/custom_loading.dart';
import 'package:abookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:abookly/features/home/presentation/view_model/featured_books_cubit/featured_books_states.dart';

import 'custom_list_view_item.dart';

class CustomBookListView extends StatelessWidget {
  const CustomBookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
     if(state is FeaturedBooksSuccessState){
       return SizedBox(
         height: 25.h,
         child: ListView.builder(
           physics: const BouncingScrollPhysics(),
           itemCount: state.books.length,
           scrollDirection: Axis.horizontal,
           itemBuilder: (context, index) {
             return Padding(
               padding: EdgeInsets.only(
                 left: 2.h,
                 right: index == 2 ? 2.h : 0,
               ),
               child:  GestureDetector(
                 onTap: (){
                   GoRouter.of(context).push(
                     AppRouter.rBookDetails,
                     extra: state.books[index]
                   );
                 },
                 child: CustomListViewItem(
                   imageUrl: state.books[index].volumeInfo?.imageLinks?.thumbnail??"",
                 ),
               ),
             );
           },
         ),
       );
     }
     else if(state is FeaturedBooksErrorState){
     return  CustomError(errorMessage: state.errorMessage,);
     }
     else{
       return const CustomLoadingIndicator();
     }
      },
    );
  }
}

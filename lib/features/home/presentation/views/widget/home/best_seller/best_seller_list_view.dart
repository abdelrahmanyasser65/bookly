import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:abookly/core/widget/custom_error_widget.dart';
import 'package:abookly/core/widget/custom_loading.dart';
import 'package:abookly/features/home/presentation/view_model/newest_books_cubit/newest_books_states.dart';

import '../../../../../../../core/resources/app_router.dart';
import '../../../../view_model/newest_books_cubit/newest_books_cubit.dart';
import 'best_seller_list_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit,NewestBooksState>(
      builder: (context, state) {
        if(state is NewestBooksSuccessState){
          return ListView.separated(
            //using SliverFillRemaining in home screen
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(height: 1.5.h,);
            },
            padding: EdgeInsets.symmetric(
                horizontal: 2.h
            ),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.rBookDetails,extra: state.books[index]);
                  },
                  child:  BestSellerListItem(
                    booksModel: state.books[index],
                  ));
            },
          );
        }else if(state is NewestBooksErrorState){
          return CustomError(errorMessage: state.errorMessage);
        }else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:abookly/core/widget/custom_error_widget.dart';
import 'package:abookly/core/widget/custom_loading.dart';
import 'package:abookly/features/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';

import '../../../view_model/similar_books_cubit/similar_books_states.dart';
import '../home/custom_list_view_item.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if(state is SimilarBooksSuccessState){
          return SizedBox(
            height: 16.h,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(width: 1.h,);
              },
              physics: const BouncingScrollPhysics(),
              itemCount: state.booksModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  CustomListViewItem(
                  imageUrl: state.booksModel[index].volumeInfo?.imageLinks?.thumbnail??"",
                );
              },
            ),
          );
        }
        else if(state is SimilarBooksErrorState){
          return CustomError(errorMessage: state.errorMessage);
        }else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}


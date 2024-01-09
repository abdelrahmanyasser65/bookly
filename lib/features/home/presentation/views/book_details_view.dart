import 'package:abookly/features/home/presentation/views/widget/book_details/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/book_models/Books_model.dart';
import '../view_model/similar_books_cubit/similar_books_cubit.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({Key? key, required this.booksModel}) : super(key: key);
 final BooksModel booksModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category: widget.booksModel.volumeInfo?.categories==[]?widget.booksModel.volumeInfo!.categories![0]:""
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(child: BookDetailsViewBody(
        booksModel: widget.booksModel,
      )),
    );
  }
}

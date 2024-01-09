

import '../../../data/models/book_models/Books_model.dart';

abstract class SimilarBooksState{}
class SimilarBooksInitialState extends SimilarBooksState{}
class SimilarBooksSuccessState extends SimilarBooksState{
  final List<BooksModel> booksModel ;
  SimilarBooksSuccessState(this.booksModel);
}
class SimilarBooksLoadingState extends SimilarBooksState{}
class SimilarBooksErrorState extends SimilarBooksState{
  final String errorMessage;
  SimilarBooksErrorState(this.errorMessage);
}

import '../../../data/models/book_models/Books_model.dart';

abstract class NewestBooksState {}
class NewestBooksInitialState extends NewestBooksState{}
class NewestBooksLoadingState extends NewestBooksState{}
class NewestBooksSuccessState extends NewestBooksState{
  final List<BooksModel>books;

  NewestBooksSuccessState(this.books);
}
class NewestBooksErrorState extends NewestBooksState{
  final String errorMessage;

  NewestBooksErrorState(this.errorMessage);
}

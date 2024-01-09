
import '../../../data/models/book_models/Books_model.dart';

abstract class FeaturedBooksState {}
class FeaturedBooksInitialState extends FeaturedBooksState{}
class FeaturedBooksSuccessState extends FeaturedBooksState{
  final List<BooksModel>books;

  FeaturedBooksSuccessState(this.books);

}
class FeaturedBooksErrorState extends FeaturedBooksState{
   final String errorMessage;

  FeaturedBooksErrorState(this.errorMessage);

}
class FeaturedBooksLoadingState extends FeaturedBooksState{}
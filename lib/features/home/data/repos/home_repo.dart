import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/book_models/Books_model.dart';

abstract class HomeRepo{
Future<Either<Failure,List<BooksModel>>>fetchNewsetBooks();
Future<Either<Failure,List<BooksModel>>>fetchFeaturedBooks();
Future<Either<Failure,List<BooksModel>>>featchSimilarBooks(
{
  required String category
}
    );
}
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/resources/api_service.dart';
import '../models/book_models/Books_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo{
   final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BooksModel>>> fetchNewsetBooks()async {
    try{
      var data=await apiService.get(endPoint: "volumes?Filtering=free-ebooks&Sorting=newest &q=subject: computer science");
      List<BooksModel>books=[];
      for(var item in data['items']){
        books.add(BooksModel.fromJson(item));
      }
       return right(books);
    }
         catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
        }

  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks()async {
    try{
      var data=await apiService.get(endPoint: "volumes?Filtering=free-ebooks&q=subject: Programming");
      List<BooksModel>books=[];
      for(var item in data['items']){
        books.add(BooksModel.fromJson(item));
      }
      return right(books);
    }
    catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> featchSimilarBooks({required String category})async {
    try{
      var data=await apiService.get(endPoint: "volumes?Filtering=free-ebooks&Sorting=relevance &q=subject: computer science");
      List<BooksModel>books=[];
      for(var item in data['items']){
        books.add(BooksModel.fromJson(item));
      }
      return right(books);
    }
    catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}
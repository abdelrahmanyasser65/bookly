
import 'package:abookly/features/home/presentation/view_model/similar_books_cubit/similar_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState>{
  SimilarBooksCubit(this.homeRepo):super(SimilarBooksInitialState());
  final HomeRepo homeRepo;
  Future<void>fetchSimilarBooks({
    required String category
})async{
    emit(SimilarBooksLoadingState());
    var result=await homeRepo.featchSimilarBooks(category: category);
    result.fold((failure){
      emit(SimilarBooksErrorState(failure.errorMessage));
    },
           (books){
      emit(SimilarBooksSuccessState(books));
           });
  }
}
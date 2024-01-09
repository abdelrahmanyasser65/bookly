
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'featured_books_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState>{
  FeaturedBooksCubit(this.homeRepo):super(FeaturedBooksInitialState());
  final HomeRepo homeRepo;
  Future<void>fetchFeaturedBooks()async{

    emit(FeaturedBooksLoadingState());
    var result=await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksErrorState(failure.errorMessage));
    }, (books) {
     emit( FeaturedBooksSuccessState(books));

    });
  }
}
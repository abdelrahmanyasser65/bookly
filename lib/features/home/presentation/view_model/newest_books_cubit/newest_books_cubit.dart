
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'newest_books_states.dart';

class NewestBooksCubit extends Cubit<NewestBooksState>{
  NewestBooksCubit(this.homeRepo):super(NewestBooksInitialState());
  final HomeRepo homeRepo;
  Future<void>fetchNewestBooks()async{
    emit(NewestBooksLoadingState());
    var result=await homeRepo.fetchNewsetBooks();
    result.fold((failure){
      emit(NewestBooksErrorState(failure.errorMessage));
    }, (books){
      emit(NewestBooksSuccessState(books));
    });
  }
}
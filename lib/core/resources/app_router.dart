


import 'package:abookly/core/resources/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/models/book_models/Books_model.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/views/search_viwe.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter{
  static const rHomeView='/homeView';
  static const rBookDetails='/bookDetails';
  static const rSearch='/searchView';
  static final router=GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context,state)=>const SplashView(),
        ),
        GoRoute(
          path: rHomeView,
          builder: (context,state)=>const HomeView(),
        ),
        GoRoute(
          path: rBookDetails,
          builder: (context,state)=>BlocProvider(
            create:(context)=>SimilarBooksCubit(getIt.get<HomeRepoImpl>()) ,
              child:  BookDetailsView(
                booksModel: state.extra as BooksModel,
              )),
        ),
        GoRoute(
          path: rSearch,
          builder: (context,state)=>const SearchView(),
        ),
      ]
  ) ;
}
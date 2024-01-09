

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../core/resources/app_router.dart';
import '../core/resources/colors.dart';
import '../core/resources/service_locator.dart';
import '../features/home/data/repos/home_repo_impl.dart';
import '../features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import '../features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context,s,d){
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context)=>FeaturedBooksCubit(getIt.get<HomeRepoImpl>())..fetchFeaturedBooks(),
            ),BlocProvider(
              create: (context)=>NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks(),
            ),

          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,

            theme: ThemeData.dark(

            ).copyWith(

              scaffoldBackgroundColor: ColorManager.primary,
              textTheme:GoogleFonts.montserratTextTheme(
                ThemeData.dark().textTheme
              )
            ),

          ),
        );
      },
    );
  }
}

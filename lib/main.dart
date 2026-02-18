import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:my_bookly/constant.dart';
import 'package:my_bookly/core/utils/routing/router_generation_config.dart';
import 'package:my_bookly/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/feature/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly/feature/home/presentation/view_model/Featured_books_cubit/featured_books_cubit.dart';
import 'package:my_bookly/feature/home/presentation/view_model/new_books_cubit/new_books_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(sl.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => NewBooksCubit(sl.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: RouterGenerationConfig.goRouter,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}

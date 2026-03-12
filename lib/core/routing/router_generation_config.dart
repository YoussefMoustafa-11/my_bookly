import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/routing/app_routes.dart';
import 'package:my_bookly/core/utils/service_locator.dart';
import 'package:my_bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/feature/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly/feature/home/presentation/view/book_details_view.dart';
import 'package:my_bookly/feature/home/presentation/view/home_view.dart';
import 'package:my_bookly/feature/home/presentation/view_model/similar_books/similar_books_cubit.dart';
import 'package:my_bookly/feature/search/presentation/view/search_view.dart';
import 'package:my_bookly/feature/splash/presentation/views/splash_view.dart';

class RouterGenerationConfig {
  static final goRouter = GoRouter(
    initialLocation: AppRoutes.splashScreen,

    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.searchScreen,
        name: AppRoutes.searchScreen,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: AppRoutes.detailScreen,
        name: AppRoutes.detailScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(sl.get<HomeRepoImpl>()),
          child: BookDetailsView(bookModel: state.extra as BookModel),
        ),
      ),
    ],
  );
}

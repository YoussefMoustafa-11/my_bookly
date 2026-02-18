import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/routing/app_routes.dart';
import 'package:my_bookly/feature/home/presentation/view/book_details_view.dart';
import 'package:my_bookly/feature/home/presentation/view/home_view.dart';
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
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}

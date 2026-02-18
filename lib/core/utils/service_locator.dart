import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_bookly/core/utils/api_service.dart';
import 'package:my_bookly/feature/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly/feature/home/presentation/view_model/Featured_books_cubit/featured_books_cubit.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton(() => ApiService(Dio()));
  sl.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl(sl<ApiService>()));
  sl.registerFactory<FeaturedBooksCubit>(
    () => FeaturedBooksCubit(sl<HomeRepoImpl>()),
  );
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_bookly/core/utils/api_service.dart';
import 'package:my_bookly/feature/home/data/repos/home_repo_impl.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<ApiService>(() =>  ApiService(Dio()));
  sl.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl(sl<ApiService>()));
}

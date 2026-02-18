import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/core/utils/api_service.dart';
import 'package:my_bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/feature/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await _apiService.get(
        endpoint:
            '/?Filter=free-ebooks&Sorting=newest&q=Subject:Computer Science',
      );
      final newestBooks = (data['items'] as List)
          .map((book) => BookModel.fromJson(book))
          .toList();

      return Right(newestBooks);
    } on DioException catch (dioException) {
      return Left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await _apiService.get(
        endpoint: '?Filter=free-ebooks&q=Subject:Programming',
      );
      final newestBooks = (data['items'] as List)
          .map((book) => BookModel.fromJson(book))
          .toList();

      return Right(newestBooks);
    } on DioException catch (dioException) {
      return Left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await _apiService.get(
        endpoint: '?Filter=free-ebooks&Sorting=relevance&q=Subject:$category',
      );
      final newestBooks = (data['items'] as List)
          .map((book) => BookModel.fromJson(book))
          .toList();

      return Right(newestBooks);
    } on DioException catch (dioException) {
      return Left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/feature/home/data/models/book_model/book_model.dart';
// home repo is the contract that the home repo implementation will follow, it defines the methods that the home repo implementation will implement, and it also defines the return type of these methods, which is either a failure or a list of book models.
// the home repo is used in the home cubit to fetch the featured books and the newest books, and it is also used in the service locator to register the home repo implementation.
// it is help us to decouple the home cubit from the home repo implementation, and it also helps us to test the home cubit by mocking the home repo.
 //
abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future <Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category});
}

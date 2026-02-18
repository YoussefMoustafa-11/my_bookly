import 'package:my_bookly/feature/home/data/models/book_model/book_model.dart';

sealed class NewestBooksState {
  const NewestBooksState();
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> books;
  const NewestBooksSuccess(this.books);
}

final class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;
  const NewestBooksFailure(this.errorMessage);
}

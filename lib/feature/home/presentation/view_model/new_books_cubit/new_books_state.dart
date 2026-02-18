

import 'package:my_bookly/feature/home/data/models/book_model/book_model.dart';

sealed class NewBooksState  {
  const NewBooksState();


}

final class NewBooksInitial extends NewBooksState {}
final class NewBooksLoading extends NewBooksState {}
final class NewBooksSuccess extends NewBooksState {
  final List<BookModel> books;
  const NewBooksSuccess(this.books);
}
final class NewBooksFailure extends NewBooksState {
  final String errorMessage;
  const NewBooksFailure(this.errorMessage);
}

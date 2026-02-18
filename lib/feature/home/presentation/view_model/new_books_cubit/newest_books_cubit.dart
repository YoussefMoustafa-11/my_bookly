import 'package:bloc/bloc.dart';

import 'package:my_bookly/feature/home/data/repos/home_repo_impl.dart';

import 'package:my_bookly/feature/home/presentation/view_model/new_books_cubit/newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepoImpl homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    try {
      var result = await homeRepo.fetchNewestBooks();
      result.fold(
        (failure) => emit(NewestBooksFailure(failure.errorMessage)),
        (books) => emit(NewestBooksSuccess(books)),
      );
    } catch (e) {
      emit(NewestBooksFailure(e.toString()));
    }
  }
}

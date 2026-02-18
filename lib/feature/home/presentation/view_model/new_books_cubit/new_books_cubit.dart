import 'package:bloc/bloc.dart';

import 'package:my_bookly/feature/home/data/repos/home_repo_impl.dart';

import 'package:my_bookly/feature/home/presentation/view_model/new_books_cubit/new_books_state.dart';

class NewBooksCubit extends Cubit<NewBooksState> {
  NewBooksCubit(this.homeRepo) : super(NewBooksInitial());
  final HomeRepoImpl homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewBooksLoading());
    try {
      var result = await homeRepo.fetchNewestBooks();
      result.fold(
        (failure) => emit(NewBooksFailure(failure.errorMessage)),
        (books) => emit(NewBooksSuccess(books)),
      );
    } catch (e) {
      emit(NewBooksFailure(e.toString()));
    }
  }
}

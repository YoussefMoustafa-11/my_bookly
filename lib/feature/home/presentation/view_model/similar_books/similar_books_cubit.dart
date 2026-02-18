import 'package:bloc/bloc.dart';

import 'package:my_bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/feature/home/data/repos/home_repo_impl.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepoImpl homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    try {
      var result = await homeRepo.fetchSimilarBooks(category: category);
      result.fold(
        (failure) => emit(SimilarBooksFailure(failure.errorMessage)),
        (books) => emit(SimilarBooksSuccess(books)),
      );
    } catch (e) {
      emit(SimilarBooksFailure(e.toString()));
    }
  }
}

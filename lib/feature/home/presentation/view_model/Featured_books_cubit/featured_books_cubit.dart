import 'package:bloc/bloc.dart';


import 'package:my_bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/feature/home/data/repos/home_repo_impl.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepoImpl homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    try {
      var result = await homeRepo.fetchFeaturedBooks();
      result.fold(
        (failure) => emit(FeaturedBooksFailure(failure.errorMessage)),
        (books) => emit(FeaturedBooksSuccess(books)),
      );
    } catch (e) {
      emit(FeaturedBooksFailure(e.toString()));
    }
  }
}

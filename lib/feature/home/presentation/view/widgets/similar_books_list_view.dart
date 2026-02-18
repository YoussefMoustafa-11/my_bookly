import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/custom_book_image_item.dart';
import 'package:my_bookly/feature/home/presentation/view_model/similar_books/similar_books_cubit.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key  ,this.bookModel});

  final BookModel? bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksInitial) {
          context
              .read<SimilarBooksCubit>()
              .fetchSimilarBooks(category: bookModel?.volumeInfo?.categories?[0] ?? '');
        } else if (state is SimilarBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImageItem(
                    imageUrl:
                        state.books[index].volumeInfo?.imageLinks?.thumbnail,
                  ),
                );
              },
            ),
          );
        }
          return const Center(child: Text('waiting for data...'));
        // return SizedBox(
        //   height: MediaQuery.of(context).size.height * .15,
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       return const Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 5),
        //         child: CustomBookImageItem(),
        //       );
        //     },
        //   ),
        // );
      },
    );
  }
}

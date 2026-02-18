import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/custom_book_image_item.dart';
import 'package:my_bookly/feature/home/presentation/view_model/Featured_books_cubit/featured_books_cubit.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksInitial) {
            context.read<FeaturedBooksCubit>().fetchFeaturedBooks();
          } else if (state is FeaturedBooksSuccess) {
            return ListView.builder(
              physics:  const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: CustomBookImageItem(
                    imageUrl:
                        state.books[index].volumeInfo!.imageLinks?.thumbnail ??
                        '',
                  ),
                );
              },
            );
          } else if (state is FeaturedBooksFailure) {
            return Center(child: Text(state.errorMessage));
          }
          return const Center(child: CircularProgressIndicator());

          // return ListView.builder(
          //   itemCount: itemCount,
          //   scrollDirection: Axis.horizontal,
          //   itemBuilder: (context, index) {
          //     return Padding(
          //       padding: EdgeInsets.only(right: 10),
          //       child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
          //         builder: (context, state) {
          //           if (state is FeaturedBooksInitial) {
          //             context.read<FeaturedBooksCubit>().fetchFeaturedBooks();
          //           }
          //           if (state is FeaturedBooksLoading) {
          //             return const Center(child: CircularProgressIndicator());
          //           } else if (state is FeaturedBooksSuccess) {
          //             return CustomBookImageItem(
          //               imageUrl:
          //                   state
          //                       .books[index]
          //                       .volumeInfo!
          //                       .imageLinks
          //                       ?.thumbnail ??
          //                   '',
          //             );
          //           } else if (state is FeaturedBooksFailure) {
          //             return Center(child: Text(state.errorMessage));
          //           } else {
          //             return const Center(child: CircularProgressIndicator());
          //           }
          //         },
          //       ),
          //     );
          //   },
          // );
        },
      ),
    );
  }
}

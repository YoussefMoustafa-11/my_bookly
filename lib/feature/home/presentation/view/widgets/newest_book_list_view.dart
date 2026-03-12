import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/book_list_view_item.dart';
import 'package:my_bookly/feature/home/presentation/view_model/new_books_cubit/newest_books_cubit.dart';
import 'package:my_bookly/feature/home/presentation/view_model/new_books_cubit/newest_books_state.dart';

class NewestBookListView extends StatelessWidget {
  const NewestBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksInitial) {
          context.read<NewestBooksCubit>().fetchNewestBooks();
        }
        if (state is NewestBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewestBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is NewestBooksSuccess) {
          return Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return BookListViewItem(bookModel: state.books[index]);
              },
            ),
          );
        }
        return const Center(child: Text('waiting for data...'));
        // return ListView.builder(
        //   physics: const NeverScrollableScrollPhysics(),
        //   padding: EdgeInsets.zero,
        //   itemCount: 12,
        //   itemBuilder: (context, index) {
        //     return Padding(
        //       padding: const EdgeInsets.only(bottom: 10),
        //       child: const BookListViewItem(),
        //     );
        //   },
        // );
      },
    );
  }
}

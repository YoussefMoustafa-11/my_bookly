import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/styles.dart';

import 'package:my_bookly/feature/home/presentation/view/widgets/books_details_section.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/custom_book_details_app_bar.dart';

import 'package:my_bookly/feature/home/presentation/view/widgets/similar_books_list_view.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: CustomScrollView(
            scrollBehavior: const ScrollBehavior(),
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomBookDetailsAppBar(),
                    ),
                    BookDetailsSection(),
                    Expanded(child: const SizedBox(height: 10)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'You can also like',
                        style: Styles.textStyle14.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const SimilarBooksListView(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

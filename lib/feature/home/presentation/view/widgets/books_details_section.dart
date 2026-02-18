import 'package:flutter/material.dart';
import 'package:my_bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/custom_book_image_item.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';

class BookDetailsSection extends StatefulWidget {
  final BookModel? bookModel;

  const BookDetailsSection({super.key, this.bookModel});

  @override
  State<BookDetailsSection> createState() => _BookDetailsSectionState();
}

class _BookDetailsSectionState extends State<BookDetailsSection> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImageItem(
            imageUrl: widget.bookModel?.volumeInfo?.imageLinks?.thumbnail,
          ),
        ),
        const SizedBox(height: 43),
        Text(
          widget.bookModel?.volumeInfo?.title ?? 'No Title',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            widget.bookModel?.volumeInfo?.authors?.first ?? 'No Author',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 37),
        BooksAction(bookModel: widget.bookModel!),
      ],
    );
  }
}

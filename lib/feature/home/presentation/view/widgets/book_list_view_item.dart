import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:my_bookly/constant.dart';
import 'package:my_bookly/core/routing/app_routes.dart';
import 'package:my_bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/custom_book_image_item.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  final BookModel? bookModel;

  const BookListViewItem({super.key, this.bookModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRoutes.detailScreen, extra: bookModel);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .16,
        child: Row(
          children: [
            CustomBookImageItem(
              imageUrl: bookModel?.volumeInfo?.imageLinks?.thumbnail,
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel?.volumeInfo?.title ?? 'No Title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    bookModel?.volumeInfo?.authors?.first ?? 'No Author',
                    style: Styles.textStyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        '${bookModel?.saleInfo?.retailPrice?.amount ?? 0} ${bookModel?.saleInfo?.retailPrice?.currencyCode ?? '\$'}',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const BookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

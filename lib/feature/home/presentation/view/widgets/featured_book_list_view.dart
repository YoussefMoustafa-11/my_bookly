import 'package:flutter/material.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/custom_book_image_item.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        itemCount: 12,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: .0),
            child: CustomBookImageItem(),
          );
        },
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImageItem extends StatelessWidget {
  final String? imageUrl;

  const CustomBookImageItem({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: CachedNetworkImage(
          imageUrl:
              imageUrl  ??
              'https://img.freepik.com/free-vector/realistic-open-book-with-blank-pages_23-2148887697.jpg?w=2000',
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),

        ),
        // Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(16),
      
        //     image: DecorationImage(
        //       fit: BoxFit.fill,
        //       image: NetworkImage(
        //         imageUrl ??
        //             'https://img.freepik.com/free-vector/realistic-open-book-with-blank-pages_23-2148887697.jpg?w=2000',
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

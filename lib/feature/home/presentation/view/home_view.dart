import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/styles.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/featured_book_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  FeaturedListViewItem(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text("Best Seller", style: Styles.textStyle18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverFillRemaining(child: BestSellerListView()),
          ],

          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     CustomAppBar(),
          //     FeaturedListViewItem(),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding: EdgeInsets.symmetric(vertical: 20.0),
          //           child: Text("Best Seller", style: Styles.textStyle18),
          //         ),
          //       ],
          //     ),
          //     BestSellerListView(),
          //   ],
          // ),
        ),
      ),
    );
  }
}

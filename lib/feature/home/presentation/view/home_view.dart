import 'package:flutter/material.dart';

import 'package:my_bookly/core/utils/styles.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/newest_book_list_view.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/featured_book_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
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
                        child: Text("Newest", style: Styles.textStyle18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverFillRemaining(child: NewestBookListView()),
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
          //           child: Text("Newest", style: Styles.textStyle18),
          //         ),
          //       ],
          //     ),
          //     NewestListView(),
          //   ],
          // ),
        ),
      ),
    );
  }
}

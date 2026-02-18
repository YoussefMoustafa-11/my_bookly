import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/styles.dart';
import 'package:my_bookly/feature/home/presentation/view/widgets/search_result_list_view.dart';
import 'package:my_bookly/feature/search/presentation/view/widgets/custom_search_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomSearchTextField(),
              SizedBox(height: 16),
              Row(children: [Text('Search Result', style: Styles.textStyle18)]),
              SizedBox(height: 8),
              Expanded(child: SearchResultListView()),
            ],
          ),
        ),
      ),
    );
  }
}

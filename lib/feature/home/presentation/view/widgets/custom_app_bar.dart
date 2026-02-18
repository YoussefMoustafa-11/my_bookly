import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/routing/app_routes.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AssetsData.logo, height: 18),
        const Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).pushNamed(AppRoutes.searchScreen);
          },
          icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 24),
        ),
      ],
    );
  }
}

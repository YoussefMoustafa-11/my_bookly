import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/assets.dart';
import 'package:my_bookly/core/utils/routing/app_routes.dart';
import 'package:my_bookly/feature/splash/presentation/views/widgets/sliding_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingTextAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    // No need to add a listener to the animation controller when using AnimatedBuilder
    // slidingTextAnimation.addListener(() {
    //   setState(() {});
    // });
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsData.logo),
          const SizedBox(height: 4),

          // rebuilds only the text when the animation value changes, not the whole widget tree
          SlidingText(slidingTextAnimation: slidingTextAnimation),

          //rebuilds the whole widget tree when the animation value changes, which is less efficient
          // SlideTransition(
          //   position: slidingTextAnimation,
          //   child: Text('Read Free Books', textAlign: TextAlign.center),
          // ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingTextAnimation = Tween<Offset>(
      begin: const Offset(0, 5),
      end: const Offset(0, 0),
    ).animate(animationController);
    animationController.forward();
    // No need to add a listener to the animation controller when using AnimatedBuilder
    // slidingTextAnimation.addListener(() {
    //   setState(() {});
    // });
  }

  Future<Null> navigateToHome() {
    return Future.delayed(
      const Duration(seconds: 3),
      () => GoRouter.of(context).pushReplacementNamed(AppRoutes.homeScreen),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart' as intro;
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/go_route_named.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/environment.dart';
import 'package:rcp/modules/authentication_module/auth_router.dart';

class OnBoardingScreen extends StatefulWidget {
  static final route = GoRouteNamedPage(
    path: '/on_boarding',
    name: 'on_boarding',
    pageBuilder: animatedPageBuilder(const OnBoardingScreen()),
  );

  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    const bg = Colors.transparent;
    final fontColor = context.colorTheme.onBackground;
    final decoration = intro.PageDecoration(
      pageColor: bg,
      titleTextStyle: context.typoraphyTheme.titleSmall
          .copyWithColor(color: fontColor)
          .textStyle,
      bodyTextStyle: context.typoraphyTheme.bodyMedium
          .copyWithColor(color: fontColor)
          .textStyle,
      pageMargin: EdgeInsets.zero,
      titlePadding: const EdgeInsets.only(top: 120),
      bodyPadding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      imagePadding: EdgeInsets.only(top: context.vHeight / 10),
      footerPadding: const EdgeInsets.symmetric(vertical: 50),
    );
    final pages = [
      intro.PageViewModel(
        decoration: decoration,
        title: "👋 Welcome to our Shopping List App!",
        bodyWidget: Column(
          children: [
            const SizedBox(height: 148),
            Text(
              "Simplify your shopping experience with our easy-to-use app. Create and share shopping lists with family and friends, add items effortlessly, and stay organized while shopping. Say goodbye to forgotten items and hello to stress-free shopping!",
              style: context.typoraphyTheme.subtitleLarge.textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 148),
          ],
        ),
      ),
      intro.PageViewModel(
        decoration: decoration,
        title: "🛠️ Discover the features of our Shopping List App!",
        bodyWidget: Column(
          children: [
            const SizedBox(height: 148),
            Text(
              'Create Shopping Lists: Easily create new shopping lists for different occasions or categories.',
              style: context.typoraphyTheme.subtitleLarge.textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Add Items Quickly: Add items to your lists with just a few taps, or use our photo recognition feature to add items by snapping a photo.',
              style: context.typoraphyTheme.subtitleLarge.textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Share Lists with Others: Collaborate with family and friends by sharing your lists. Everyone can see updates in real-time.',
              style: context.typoraphyTheme.subtitleLarge.textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Stay Organized: Keep track of purchased items, set quantities, and categorize your shopping lists for better organization.',
              style: context.typoraphyTheme.subtitleLarge.textStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      intro.PageViewModel(
        decoration: decoration,
        title: "🚀 Ready to get started with our Shopping List App?",
        bodyWidget: Column(
          children: [
            const SizedBox(height: 148),
            Text(
              '1. Sign Up: Create your account to access all the features of our app. It\'s quick, easy, and free!',
              style: context.typoraphyTheme.subtitleLarge.textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              '2. Create Your First List: Once you\'re signed in, create your first shopping list by tapping on the "+" button. Give your list a name and start adding items.',
              style: context.typoraphyTheme.subtitleLarge.textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              '3. Share with Others: Invite family members or friends to join your list and collaborate on shopping together. Simply tap on the share icon and enter their email addresses.',
              style: context.typoraphyTheme.subtitleLarge.textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              '4. Start Shopping: Head to the store with your organized shopping list in hand. Mark off items as you go and enjoy a stress-free shopping experience!',
              style: context.typoraphyTheme.subtitleLarge.textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "Let's make shopping easier and more enjoyable together!",
              style: context.typoraphyTheme.subtitleLarge.textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
          ],
        ),
      )
    ];
    return BasicBackgroundContainer(
      child: MobileFrame(
        child: intro.IntroductionScreen(
          key: introKey,
          globalBackgroundColor: bg,
          controlsPadding: const EdgeInsets.all(32),
          dotsDecorator: intro.DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(50.0, 10.0),
            activeColor: context.colorTheme.primary,
            color: fontColor,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
          dotsContainerDecorator: const BoxDecoration(color: bg),
          pages: pages,
          showSkipButton: true,
          skipStyle: const ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          nextStyle: const ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          doneStyle: const ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          skip: BasicElevatedButton(
            width: MediaQuery.sizeOf(context).width,
            labelText: 'Skip',
            onPressed: () => introKey.currentState!.skipToEnd(),
          ),
          next: BasicElevatedButton(
            width: MediaQuery.sizeOf(context).width,
            labelText: 'Next',
            onPressed: () => introKey.currentState!.next(),
          ),
          done: BasicElevatedButton(
            width: MediaQuery.sizeOf(context).width,
            labelText: 'Done',
            onPressed: onDone,
          ),
          onDone: () => onDone(),
          onSkip: () => onDone(),
        ),
      ),
    );
  }

  void onDone() {
    // change it to false so we don't see it next time
    // TODO, move it to intro done function
    // to only change it to seen when user is actually done with intro
    locator
        .get<SharedPreferences>()
        .setBool(Environment.isIntroCheckedKey, true)
        .then((_) => context.goNamed(authRoute.name));
  }
}

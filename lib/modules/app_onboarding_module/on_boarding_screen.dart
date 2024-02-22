import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart' as intro;
import 'package:introduction_screen/introduction_screen.dart';

import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/modules/authentication_module/auth_router.dart';
import 'package:rcp/packages/constants/ui_constants.dart';
import 'package:rcp/utils/extensions/context_ui_extension.dart';

class OnBoardingScreen extends StatefulWidget {
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
      pageColor: context.colorTheme.background,
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
        title: "👋 Hey Fam!",
        bodyWidget: Column(
          children: [
            Text(
              "Welcome to our little corner of the language-learning world! 🌍✨ Just a heads up, WordWise is my passion project – a labor of love aimed at making English essential words a breeze to learn.\n\nNow, let's keep it real. 🚀 This app isn't aiming to be the flashiest flashcard app out there. It's my personal playground, and I'm cooking up some cool features to make it better. But hey, Rome wasn't built in a day, right?",
              style: decoration.bodyTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 148),
          ],
        ),
      ),
      intro.PageViewModel(
        decoration: decoration,
        title: "🛠️ Upgrades in the Pipeline",
        body:
            "I'm rolling up my sleeves to add the stuff you want most, but here's the deal: it won't be perfect. And that's cool! Think of WordWise like your favorite cozy café – it might not have a five-star chef, but it's got heart, and we're in this together.",
      ),
      intro.PageViewModel(
        decoration: decoration,
        title: "🙏 Your Patience is Key",
        body:
            "I get it – you might want that whiz-bang feature from the other flashcard giants. Hold tight, and we'll get there, one update at a time. Your feedback is my secret sauce, so if you have thoughts, shout them out!",
      ),
      intro.PageViewModel(
        decoration: decoration,
        title: "🚀 Ready to Roll",
        bodyWidget: Column(
          children: [
            Text(
              "WordWise might not be aiming for gold, but it's here to make learning essential English words a tad more fun. So, let's dive in, make mistakes, learn, and maybe share a laugh or two along the way.",
              style: decoration.bodyTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
          ],
        ),
      )
    ];
    return Container(
      color: context.colorTheme.background,
      child: Stack(
        children: [
          intro.IntroductionScreen(
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
            skip: _buildButton('Skip', context),
            next: _buildButton('Next', context),
            done: _buildButton('Done', context),
            onDone: () => onDone(),
            onSkip: () => onDone(),
          ),
        ],
      ),
    );
  }

  void onDone() {
    context.goNamed(signinRoute.name);
  }

  Widget _buildButton(
    String text,
    BuildContext context,
  ) {
    return Container(
      padding: kTinyPadding,
      alignment: Alignment.center,
      constraints: const BoxConstraints.expand(height: 48),
      decoration: ShapeDecoration(
        color: context.colorTheme.primary,
        shape: const StadiumBorder(
          side: BorderSide(
            width: 0,
            color: Colors.transparent,
          ),
        ),
      ),
      child: Text(
        text,
        style: context.typoraphyTheme.subtitleMedium.onPrimary.textStyle,
      ),
    );
  }
}

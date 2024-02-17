import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    super.key,
    this.color,
    this.onPressed,
  });

  final Color? color;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final navigator = GoRouter.of(context);
    // navigator.print(navigator.canPop());
    if (!navigator.canPop()) {
      return const SizedBox.shrink();
    }

    assert(debugCheckHasMaterialLocalizations(context));

    return IconButton(
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: const BackButtonIcon(),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          navigator.pop(true);
        }
      },
    );
  }
}

class TestScreen extends StatelessWidget {
  final String title;
  const TestScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(slivers: [
        SliverAppBar(
          leading: const MyBackButton(),
          title: Text(title),
        ),
        SliverFillRemaining(
          child: Center(
            child: Text(title),
          ),
        )
      ]),
    );
  }
}

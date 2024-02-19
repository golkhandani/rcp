import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:colorful_safe_area/colorful_safe_area.dart';

import 'package:bnf/core/theme/dwew.dart';

class ScaffoldShell extends StatelessWidget {
  final Widget child;
  final Color? safeareaColor;
  final Color? bodyColor;
  final EdgeInsets padding;
  const ScaffoldShell({
    super.key,
    required this.child,
    this.safeareaColor,
    this.bodyColor,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: (safeareaColor ?? context.colorTheme.navBackground)
                    .computeLuminance() >
                0.5
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        child: ColorfulSafeArea(
          color: safeareaColor ?? context.colorTheme.navBackground,
          child: Scaffold(
            extendBody: false,
            extendBodyBehindAppBar: false,
            backgroundColor: bodyColor ?? context.colorTheme.background,
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

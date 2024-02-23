import 'package:flutter/material.dart';

import 'package:colorful_safe_area/colorful_safe_area.dart';

import 'package:rcp/core/theme/flex_theme_provider.dart';

class DashboardScreenShell extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? safeAreaColor;
  final bool useSafeArea;
  const DashboardScreenShell({
    super.key,
    required this.child,
    this.backgroundColor,
    this.safeAreaColor,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: const Duration(milliseconds: 200),
      color: backgroundColor ?? context.colorTheme.background,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: useSafeArea
            ? ColorfulSafeArea(
                topColor: safeAreaColor ?? context.colorTheme.navBackground,
                bottomColor: Colors.transparent,
                child: child,
              )
            : child,
      ),
    );
  }
}

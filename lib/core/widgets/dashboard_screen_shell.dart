import 'package:flutter/material.dart';

import 'package:bnf/core/theme/dwew.dart';

class DashboardScreenShell extends StatelessWidget {
  final Widget child;
  const DashboardScreenShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: const Duration(milliseconds: 200),
      color: context.colorTheme.background,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: child,
      ),
    );
  }
}

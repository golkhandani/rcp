import 'package:flutter/material.dart';

import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';

class AppThemeElevatedButton extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final double height;
  final double width;
  final BoxConstraints? constraints;
  final Color? background;
  final Color? foreground;
  const AppThemeElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding = const EdgeInsets.all(8),
    this.height = 48,
    this.width = double.infinity,
    this.background,
    this.foreground,
    this.isLoading = false,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final c = background ?? context.customTheme.pallete.primary;
    final f = foreground ?? context.customTheme.pallete.onPrimary;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: constraints == null ? Size(width, height) : null,
        padding: padding,
        maximumSize: constraints == null
            ? null
            : Size(constraints!.maxWidth, constraints!.maxHeight),
        minimumSize: constraints == null
            ? null
            : Size(constraints!.minWidth, constraints!.minHeight),
        splashFactory: NoSplash.splashFactory,
        shadowColor: Colors.black45,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: c,
        foregroundColor: f,
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? Padding(
              padding: const EdgeInsets.all(8),
              child: CircularProgressIndicator(
                color: f,
              ),
            )
          : child,
    );
  }
}

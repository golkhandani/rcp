import 'package:flutter/material.dart';

import 'package:bnf/core/theme/decorations.dart';
import 'package:bnf/core/theme/dwew.dart';

/// EXTENSIONS

extension MaterialTheme on CustomThemeProvider {
  ThemeData materialBaseTheme(ThemeData themeData) {
    return themeData.copyWith(
      cardColor: pallete.background,
      inputDecorationTheme: AppThemeInputDecorationTheme(appTheme: this),
      scaffoldBackgroundColor: pallete.background,
      splashFactory: NoSplash.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: pallete.navBackground,
        shadowColor: Colors.black38,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}

extension ColorEffect on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}

extension DecorationExtentions on BuildContext {
  AppThemeInputDecoration inputDecoration({
    String? labelText,
    String? hintText,
    String? contentPadding,
    Widget? suffix,
  }) =>
      AppThemeInputDecoration(
        appTheme: CustomThemeProvider.of(this),
        labelText: labelText,
        hintText: hintText,
        contentPadding: contentPadding,
        suffix: suffix,
      );

  AppThemeInputDecoration onPrimaryBackgroundInputDecoration({
    String? labelText,
    String? hintText,
    String? contentPadding,
    Widget? suffix,
  }) =>
      AppThemeInputDecoration.onPrimaryBackground(
        appTheme: CustomThemeProvider.of(this),
        labelText: labelText,
        hintText: hintText,
        contentPadding: contentPadding,
        suffix: suffix,
      );

  AppThemeInputDecoration onSecondaryBackgroundInputDecoration({
    String? labelText,
    String? hintText,
    String? contentPadding,
    Widget? suffix,
  }) =>
      AppThemeInputDecoration.onSecondaryBackground(
        appTheme: CustomThemeProvider.of(this),
        labelText: labelText,
        hintText: hintText,
        contentPadding: contentPadding,
        suffix: suffix,
      );

  AppThemeInputDecorationTheme inputDecorationTheme({
    String? labelText,
    String? hintText,
    String? contentPadding,
    Widget? suffix,
  }) =>
      AppThemeInputDecorationTheme(
        appTheme: CustomThemeProvider.of(this),
        labelText: labelText,
        hintText: hintText,
      );
}

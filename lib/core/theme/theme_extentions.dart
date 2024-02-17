import 'package:flutter/material.dart';

import 'package:bnf/core/theme/decorations.dart';
import 'package:bnf/core/theme/theme_system.dart';

/// EXTENSIONS
/// import 'package:flutter/material.dart';

extension MaterialTheme on AppTheme {
  ThemeData materialBaseTheme(ThemeData themeData) {
    return themeData.copyWith(
      cardColor: colorTheme.background,
      inputDecorationTheme: AppThemeInputDecorationTheme(appTheme: this),
      scaffoldBackgroundColor: colorTheme.background,
      splashFactory: NoSplash.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: colorTheme.navBackground,
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

extension CopyWithColor on TextStyle {
  TextStyle? withColor(Color color) => copyWith(color: color);
}

extension AppThemeExtentions on BuildContext {
  AppColorTheme get colorTheme => AppTheme.of(this).colorTheme;
  AppTextTheme get textTheme => AppTheme.of(this).textTheme;
  AppTheme get appTheme => AppTheme.of(this);

  AppThemeInputDecoration inputDecoration({
    String? labelText,
    String? hintText,
    String? contentPadding,
    Widget? suffix,
  }) =>
      AppThemeInputDecoration(
        appTheme: AppTheme.of(this),
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
        appTheme: AppTheme.of(this),
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
        appTheme: AppTheme.of(this),
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
        appTheme: AppTheme.of(this),
        labelText: labelText,
        hintText: hintText,
      );
}

extension AppTextStyleColor on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}

extension AppTextColor on AppTextTheme {
  AppTextTheme withColor(Color color) => copyWith(color: color);

  /// COLORS
  AppTextTheme get primary => copyWith(color: colorTheme.primary);
  AppTextTheme get onPrimary => copyWith(color: colorTheme.onPrimary);
  AppTextTheme get primaryContainer =>
      copyWith(color: colorTheme.primaryContainer);
  AppTextTheme get onPrimaryContainer =>
      copyWith(color: colorTheme.onPrimaryContainer);
  AppTextTheme get secondary => copyWith(color: colorTheme.secondary);
  AppTextTheme get onSecondary => copyWith(color: colorTheme.onSecondary);
  AppTextTheme get secondaryContainer =>
      copyWith(color: colorTheme.secondaryContainer);
  AppTextTheme get onSecondaryContainer =>
      copyWith(color: colorTheme.onSecondaryContainer);
  AppTextTheme get tertiary => copyWith(color: colorTheme.tertiary);
  AppTextTheme get onTertiary => copyWith(color: colorTheme.onTertiary);
  AppTextTheme get tertiaryContainer =>
      copyWith(color: colorTheme.tertiaryContainer);
  AppTextTheme get onTertiaryContainer =>
      copyWith(color: colorTheme.onTertiaryContainer);
  AppTextTheme get error => copyWith(color: colorTheme.error);
  AppTextTheme get onError => copyWith(color: colorTheme.onError);
  AppTextTheme get errorContainer => copyWith(color: colorTheme.errorContainer);
  AppTextTheme get onErrorContainer =>
      copyWith(color: colorTheme.onErrorContainer);
  AppTextTheme get success => copyWith(color: colorTheme.success);
  AppTextTheme get onSuccess => copyWith(color: colorTheme.onSuccess);
  AppTextTheme get successContainer =>
      copyWith(color: colorTheme.successContainer);
  AppTextTheme get onSuccessContainer =>
      copyWith(color: colorTheme.onSuccessContainer);
  AppTextTheme get background => copyWith(color: colorTheme.background);
  AppTextTheme get onBackground => copyWith(color: colorTheme.onBackground);
  AppTextTheme get surface => copyWith(color: colorTheme.surface);
  AppTextTheme get onSurface => copyWith(color: colorTheme.onSurface);
  AppTextTheme get highlight => copyWith(color: colorTheme.highlight);
  AppTextTheme get onHighlight => copyWith(color: colorTheme.onHighlight);
  AppTextTheme get shadow => copyWith(color: colorTheme.shadow);

  AppTextTheme get onNavBackground =>
      copyWith(color: colorTheme.onNavBackground);
  AppTextTheme get navBackground => copyWith(color: colorTheme.navBackground);
  AppTextTheme get onNavSelected => copyWith(color: colorTheme.onNavSelected);
  AppTextTheme get onNavUnselected =>
      copyWith(color: colorTheme.onNavUnselected);

  AppTextTheme get cardBackground => copyWith(color: colorTheme.cardBackground);
  AppTextTheme get onCardBackground =>
      copyWith(color: colorTheme.onCardBackground);

  AppTextTheme get chipBackground => copyWith(color: colorTheme.chipBackground);
  AppTextTheme get onChipBackground =>
      copyWith(color: colorTheme.onChipBackground);
  AppTextTheme get onTextFieldBackground =>
      copyWith(color: colorTheme.onTextFieldBackground);
  AppTextTheme get textFieldBackground =>
      copyWith(color: colorTheme.textFieldBackground);
  AppTextTheme get chipDisabledBackground =>
      copyWith(color: colorTheme.chipDisabledBackground);
  AppTextTheme get onChipDisabledBackground =>
      copyWith(color: colorTheme.onChipDisabledBackground);
}

extension AppTextSizer on AppTextTheme {
  AppTextTheme get headerLarge => copyWith(fontSize: 32);
  AppTextTheme get headerMedium => copyWith(fontSize: 28);
  AppTextTheme get headerSmall => copyWith(fontSize: 26);

  AppTextTheme get titleLarge =>
      copyWith(fontSize: 22, fontWeight: FontWeight.w900);
  AppTextTheme get titleMedium =>
      copyWith(fontSize: 20, fontWeight: FontWeight.w800);
  AppTextTheme get titleSmall =>
      copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  AppTextTheme get titleTiny =>
      copyWith(fontSize: 16, fontWeight: FontWeight.w600);

  AppTextTheme get subtitleLarge =>
      copyWith(fontSize: 16, fontWeight: FontWeight.w700);
  AppTextTheme get subtitleMedium =>
      copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  AppTextTheme get subtitleSmall =>
      copyWith(fontSize: 12, fontWeight: FontWeight.w500);
  AppTextTheme get subtitleTiny =>
      copyWith(fontSize: 10, fontWeight: FontWeight.w400);

  AppTextTheme get bodyLarge =>
      copyWith(fontSize: 16, fontWeight: FontWeight.w400);
  AppTextTheme get bodyMedium =>
      copyWith(fontSize: 14, fontWeight: FontWeight.w400);
  AppTextTheme get bodySmall =>
      copyWith(fontSize: 12, fontWeight: FontWeight.w300);

  AppTextTheme get hint => copyWith(fontSize: 12);
  AppTextTheme get label => copyWith(fontSize: 12);
}

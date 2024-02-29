import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';

class CustomThemeTyporaphy {
  final CustomThemePallete _pallete;
  final TextStyle textStyle;
  const CustomThemeTyporaphy({
    required CustomThemePallete pallete,
    required this.textStyle,
  }) : _pallete = pallete;

  CustomThemePallete get pallete => _pallete;

  CustomThemeTyporaphy copyWith({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) {
    return CustomThemeTyporaphy(
      pallete: _pallete,
      textStyle: textStyle.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        decorationColor: color,
      ),
    );
  }
}

class CustomThemePallete extends ColorScheme {
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;

  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;

  final Color highlight;
  final Color onHighlight;

  final Color navBackground;
  final Color onNavBackground;
  final Color onNavSelected;
  final Color onNavUnselected;
  final Color textFieldBackground;
  final Color onTextFieldBackground;
  final Color tabBarSelected;
  final Color onTabBarSelected;
  final Color tabBarUnselected;
  final Color onTabBarUnselected;
  final Color chipDisabledBackground;
  final Color onChipDisabledBackground;
  final Color chipBackground;
  final Color onChipBackground;

  final Color cardBackground;
  final Color onCardBackground;

  final Color backBtnBackground;
  final Color onBackBtnBackground;
  const CustomThemePallete({
    required super.brightness,
    required super.primary,
    required super.onPrimary,
    required super.primaryContainer,
    required super.onPrimaryContainer,
    required super.secondary,
    required super.onSecondary,
    required super.secondaryContainer,
    required super.onSecondaryContainer,
    required super.tertiary,
    required super.onTertiary,
    required super.tertiaryContainer,
    required super.onTertiaryContainer,
    required super.error,
    required super.onError,
    required super.errorContainer,
    required super.onErrorContainer,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    required super.background,
    required super.onBackground,
    required super.surface,
    required super.onSurface,
    required this.highlight,
    required this.onHighlight,
    required super.shadow,
    required this.navBackground,
    required this.onNavBackground,
    required this.onNavSelected,
    required this.onNavUnselected,
    required this.textFieldBackground,
    required this.onTextFieldBackground,
    required this.tabBarSelected,
    required this.onTabBarSelected,
    required this.tabBarUnselected,
    required this.onTabBarUnselected,
    required this.chipDisabledBackground,
    required this.onChipDisabledBackground,
    required this.chipBackground,
    required this.onChipBackground,
    required this.cardBackground,
    required this.onCardBackground,
    required this.backBtnBackground,
    required this.onBackBtnBackground,
    required super.scrim,
    required super.inverseSurface,
    required super.onInverseSurface,
    required super.inversePrimary,
    required super.surfaceTint,
    required super.outlineVariant,
    required super.outline,
    required super.onSurfaceVariant,
    required super.surfaceVariant,
  });
}

class CustomThemeProvider extends InheritedWidget {
  final CustomThemePallete _pallete;
  final CustomThemeTyporaphy _typoraphy;
  const CustomThemeProvider({
    super.key,
    required super.child,
    required CustomThemePallete pallete,
    required CustomThemeTyporaphy typoraphy,
  })  : _pallete = pallete,
        _typoraphy = typoraphy;

  CustomThemePallete get pallete => _pallete;
  CustomThemeTyporaphy get typoraphy => _typoraphy;
  ThemeData get _flex => FlexThemeData.light(
        scheme: FlexScheme.custom,
        colorScheme: pallete,
        subThemesData: FlexSubThemesData(
          blendOnColors: true,
          blendTextTheme: true,
          useTextTheme: true,
          thinBorderWidth: 2.0,
          thickBorderWidth: 2.0,
          defaultRadius: 12.0,
          inputDecoratorSchemeColor: SchemeColor.surface,
          inputDecoratorFillColor: pallete.onTextFieldBackground,
          inputDecoratorBorderSchemeColor: SchemeColor.primary,
          inputDecoratorPrefixIconSchemeColor: SchemeColor.onPrimaryContainer,
          inputCursorSchemeColor: SchemeColor.onPrimaryContainer,
          inputSelectionSchemeColor: SchemeColor.primaryContainer,
          alignedDropdown: true,
          tooltipRadius: 4,
          tooltipSchemeColor: SchemeColor.inverseSurface,
          tooltipOpacity: 0.9,
          useInputDecoratorThemeInDialogs: true,
          snackBarElevation: 6,
          snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
          navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationRailLabelType: NavigationRailLabelType.none,
          navigationBarElevation: 210,
        ),
        keyColors: const FlexKeyColors(),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        surfaceTint: Colors.transparent,
        swapLegacyOnMaterial3: true,
        fontFamily: typoraphy.textStyle.fontFamily,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      );
  ThemeData get data => _flex.copyWith(
        progressIndicatorTheme: _flex.progressIndicatorTheme.copyWith(
          color: pallete.primary,
        ),
        inputDecorationTheme: _flex.inputDecorationTheme.copyWith(
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: pallete.primary,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: pallete.primaryContainer,
              width: 2.0,
            ),
          ),
        ),
      );
  Brightness get brightness => pallete.brightness;
  static CustomThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CustomThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

extension ThemedText on CustomThemeTyporaphy {
  CustomThemeTyporaphy copyWithColor({required Color color}) => copyWith(
        color: color,
      );

  CustomThemeTyporaphy copyWithStyle({
    double? fontSize,
    FontWeight? fontWeight,
  }) =>
      copyWith(
        fontSize: fontSize,
        fontWeight: fontWeight,
      );

  /// COLORS
  CustomThemeTyporaphy get primary => copyWith(color: pallete.primary);
  CustomThemeTyporaphy get primaryLink => subtitleMedium.copyWith(
        color: pallete.primary,
        decoration: TextDecoration.underline,
      );
  CustomThemeTyporaphy get onPrimary => copyWithColor(color: pallete.onPrimary);
  CustomThemeTyporaphy get primaryContainer =>
      copyWithColor(color: pallete.primaryContainer);

  CustomThemeTyporaphy get onPrimaryContainer =>
      copyWithColor(color: pallete.onPrimaryContainer);
  CustomThemeTyporaphy get secondary => copyWithColor(color: pallete.secondary);
  CustomThemeTyporaphy get secondaryLink => secondary.copyWith(
        decoration: TextDecoration.underline,
      );
  CustomThemeTyporaphy get onSecondary =>
      copyWithColor(color: pallete.onSecondary);

  CustomThemeTyporaphy get secondaryContainer =>
      copyWithColor(color: pallete.secondaryContainer);
  CustomThemeTyporaphy get onSecondaryContainer =>
      copyWithColor(color: pallete.onSecondaryContainer);
  CustomThemeTyporaphy get tertiary => copyWithColor(color: pallete.tertiary);
  CustomThemeTyporaphy get onTertiary =>
      copyWithColor(color: pallete.onTertiary);
  CustomThemeTyporaphy get tertiaryContainer =>
      copyWithColor(color: pallete.tertiaryContainer);
  CustomThemeTyporaphy get onTertiaryContainer =>
      copyWithColor(color: pallete.onTertiaryContainer);
  CustomThemeTyporaphy get error => copyWithColor(color: pallete.error);
  CustomThemeTyporaphy get onError => copyWithColor(color: pallete.onError);
  CustomThemeTyporaphy get errorContainer =>
      copyWithColor(color: pallete.errorContainer);
  CustomThemeTyporaphy get onErrorContainer =>
      copyWithColor(color: pallete.onErrorContainer);
  CustomThemeTyporaphy get success => copyWithColor(color: pallete.success);
  CustomThemeTyporaphy get onSuccess => copyWithColor(color: pallete.onSuccess);
  CustomThemeTyporaphy get successContainer =>
      copyWithColor(color: pallete.successContainer);
  CustomThemeTyporaphy get onSuccessContainer =>
      copyWithColor(color: pallete.onSuccessContainer);
  CustomThemeTyporaphy get background =>
      copyWithColor(color: pallete.background);
  CustomThemeTyporaphy get onBackground =>
      copyWithColor(color: pallete.onBackground);
  CustomThemeTyporaphy get surface => copyWithColor(color: pallete.surface);
  CustomThemeTyporaphy get onSurface => copyWithColor(color: pallete.onSurface);
  CustomThemeTyporaphy get highlight => copyWithColor(color: pallete.highlight);
  CustomThemeTyporaphy get onHighlight =>
      copyWithColor(color: pallete.onHighlight);
  CustomThemeTyporaphy get shadow => copyWithColor(color: pallete.shadow);

  CustomThemeTyporaphy get onNavBackground =>
      copyWithColor(color: pallete.onNavBackground);
  CustomThemeTyporaphy get navBackground =>
      copyWithColor(color: pallete.navBackground);
  CustomThemeTyporaphy get onNavSelected =>
      copyWithColor(color: pallete.onNavSelected);
  CustomThemeTyporaphy get onNavUnselected =>
      copyWithColor(color: pallete.onNavUnselected);

  CustomThemeTyporaphy get cardBackground =>
      copyWithColor(color: pallete.cardBackground);
  CustomThemeTyporaphy get onCardBackground =>
      copyWithColor(color: pallete.onCardBackground);

  CustomThemeTyporaphy get chipBackground =>
      copyWithColor(color: pallete.chipBackground);
  CustomThemeTyporaphy get onChipBackground =>
      copyWithColor(color: pallete.onChipBackground);
  CustomThemeTyporaphy get onTextFieldBackground =>
      copyWithColor(color: pallete.onTextFieldBackground);
  CustomThemeTyporaphy get textFieldBackground =>
      copyWithColor(color: pallete.textFieldBackground);
  CustomThemeTyporaphy get chipDisabledBackground =>
      copyWithColor(color: pallete.chipDisabledBackground);
  CustomThemeTyporaphy get onChipDisabledBackground =>
      copyWithColor(color: pallete.onChipDisabledBackground);

  // STYLES

  CustomThemeTyporaphy get headerLarge => copyWithStyle(
        fontSize: 2 * textStyle.fontSize!,
      );
  CustomThemeTyporaphy get headerMedium => copyWithStyle(
        fontSize: 1.8 * textStyle.fontSize!,
      );
  CustomThemeTyporaphy get headerSmall => copyWithStyle(
        fontSize: 1.6 * textStyle.fontSize!,
      );

  CustomThemeTyporaphy get titleLarge => copyWithStyle(
      fontSize: 1.6 * textStyle.fontSize!, fontWeight: FontWeight.w900);
  CustomThemeTyporaphy get titleMedium => copyWithStyle(
      fontSize: 1.4 * textStyle.fontSize!, fontWeight: FontWeight.w800);
  CustomThemeTyporaphy get titleSmall => copyWithStyle(
      fontSize: 1.2 * textStyle.fontSize!, fontWeight: FontWeight.w700);
  CustomThemeTyporaphy get titleTiny =>
      copyWithStyle(fontSize: textStyle.fontSize!, fontWeight: FontWeight.w600);

  CustomThemeTyporaphy get subtitleLarge =>
      copyWithStyle(fontSize: textStyle.fontSize!, fontWeight: FontWeight.w700);
  CustomThemeTyporaphy get subtitleMedium => copyWithStyle(
      fontSize: 0.8 * textStyle.fontSize!, fontWeight: FontWeight.w600);
  CustomThemeTyporaphy get subtitleSmall => copyWithStyle(
      fontSize: 0.6 * textStyle.fontSize!, fontWeight: FontWeight.w500);
  CustomThemeTyporaphy get subtitleTiny => copyWithStyle(
      fontSize: 0.4 * textStyle.fontSize!, fontWeight: FontWeight.w400);

  CustomThemeTyporaphy get bodyLarge =>
      copyWithStyle(fontSize: textStyle.fontSize!, fontWeight: FontWeight.w400);
  CustomThemeTyporaphy get bodyMedium => copyWithStyle(
      fontSize: 0.8 * textStyle.fontSize!, fontWeight: FontWeight.w400);
  CustomThemeTyporaphy get bodySmall => copyWithStyle(
      fontSize: 0.6 * textStyle.fontSize!, fontWeight: FontWeight.w300);

  CustomThemeTyporaphy get hint =>
      copyWithStyle(fontSize: 0.6 * textStyle.fontSize!);
  CustomThemeTyporaphy get label =>
      copyWithStyle(fontSize: 0.6 * textStyle.fontSize!);
  CustomThemeTyporaphy get caption =>
      copyWithStyle(fontSize: 0.58 * textStyle.fontSize!);
}

extension CustomTheme on BuildContext {
  CustomThemeProvider get customTheme => CustomThemeProvider.of(this);
  CustomThemeTyporaphy get typoraphyTheme =>
      CustomThemeProvider.of(this).typoraphy;
  CustomThemePallete get colorTheme => CustomThemeProvider.of(this).pallete;
  ThemeData get themeData => CustomThemeProvider.of(this).data;
}

extension Decorations on ThemeData {
  InputDecoration get inputDecoration {
    return InputDecoration(
      iconColor: inputDecorationTheme.iconColor,
      labelStyle: inputDecorationTheme.labelStyle,
      floatingLabelStyle: inputDecorationTheme.floatingLabelStyle,
      helperStyle: inputDecorationTheme.helperStyle,
      helperMaxLines: inputDecorationTheme.helperMaxLines,
      hintStyle: inputDecorationTheme.hintStyle,
      hintFadeDuration: inputDecorationTheme.hintFadeDuration,
      errorStyle: inputDecorationTheme.errorStyle,
      errorMaxLines: inputDecorationTheme.errorMaxLines,
      floatingLabelBehavior: inputDecorationTheme.floatingLabelBehavior,
      floatingLabelAlignment: inputDecorationTheme.floatingLabelAlignment,
      isCollapsed: inputDecorationTheme.isCollapsed,
      isDense: inputDecorationTheme.isDense,
      contentPadding: inputDecorationTheme.contentPadding,
      prefixStyle: inputDecorationTheme.prefixStyle,
      prefixIconColor: inputDecorationTheme.prefixIconColor,
      suffixStyle: inputDecorationTheme.suffixStyle,
      suffixIconColor: inputDecorationTheme.suffixIconColor,
      counterStyle: inputDecorationTheme.counterStyle,
      filled: inputDecorationTheme.filled,
      fillColor: inputDecorationTheme.fillColor,
      focusColor: inputDecorationTheme.focusColor,
      hoverColor: inputDecorationTheme.hoverColor,
      errorBorder: inputDecorationTheme.errorBorder,
      focusedBorder: inputDecorationTheme.focusedBorder,
      focusedErrorBorder: inputDecorationTheme.focusedErrorBorder,
      disabledBorder: inputDecorationTheme.disabledBorder,
      enabledBorder: inputDecorationTheme.enabledBorder,
      border: inputDecorationTheme.border,
      alignLabelWithHint: inputDecorationTheme.alignLabelWithHint,
      constraints: inputDecorationTheme.constraints,
    );
  }
}

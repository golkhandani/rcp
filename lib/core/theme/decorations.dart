import 'package:flutter/material.dart';

import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/core/theme/theme_extentions.dart';

class AppThemeInputDecoration extends InputDecoration {
  const AppThemeInputDecoration._({
    super.labelText,
    required super.focusedBorder,
    required super.enabledBorder,
    required super.disabledBorder,
    required super.errorBorder,
    required super.focusedErrorBorder,
    required super.labelStyle,
    super.hintText,
    super.floatingLabelAlignment,
    super.contentPadding = EdgeInsets.zero,
    super.alignLabelWithHint,
    super.suffixIcon,
  });

  factory AppThemeInputDecoration({
    required CustomThemeProvider appTheme,
    String? labelText,
    String? hintText,
    String? contentPadding,
    Widget? suffix,
  }) {
    return AppThemeInputDecoration._(
      labelText: labelText,
      hintText: hintText,
      labelStyle: appTheme.typoraphy.subtitleMedium.onBackground.textStyle,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.all(12),
      suffixIcon: suffix,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.primary,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.primaryContainer,
          width: 2.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.cardBackground.darken(0.9).withOpacity(0.1),
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.errorContainer,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.error,
          width: 2.0,
        ),
      ),
    );
  }

  factory AppThemeInputDecoration.onPrimaryBackground({
    required CustomThemeProvider appTheme,
    String? labelText,
    String? hintText,
    String? contentPadding,
    Widget? suffix,
  }) {
    return AppThemeInputDecoration._(
      labelText: labelText,
      hintText: hintText,
      labelStyle: appTheme.typoraphy.subtitleMedium
          .copyWithColor(
            color: appTheme.pallete.onSecondary,
          )
          .textStyle,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.all(12),
      suffixIcon: suffix,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.onPrimary,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.primaryContainer,
          width: 2.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.onPrimary.darken(0.9).withOpacity(0.1),
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.errorContainer,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.error,
          width: 2.0,
        ),
      ),
    );
  }

  factory AppThemeInputDecoration.onSecondaryBackground({
    required CustomThemeProvider appTheme,
    String? labelText,
    String? hintText,
    String? contentPadding,
    Widget? suffix,
  }) {
    return AppThemeInputDecoration._(
      labelText: labelText,
      hintText: hintText,
      labelStyle: appTheme.typoraphy.subtitleMedium
          .copyWithColor(
            color: appTheme.pallete.onSecondary,
          )
          .textStyle,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.all(12),
      suffixIcon: suffix,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.onSecondary,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.primaryContainer,
          width: 2.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.onSecondary.darken(0.9).withOpacity(0.1),
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.errorContainer,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.error,
          width: 2.0,
        ),
      ),
    );
  }
}

class AppThemeInputDecorationTheme extends InputDecorationTheme {
  const AppThemeInputDecorationTheme._({
    required super.focusedBorder,
    required super.enabledBorder,
    required super.disabledBorder,
    required super.labelStyle,
    super.contentPadding = EdgeInsets.zero,
    super.floatingLabelAlignment,
    super.alignLabelWithHint,
  });

  factory AppThemeInputDecorationTheme({
    required CustomThemeProvider appTheme,
    String? labelText,
    String? hintText,
  }) {
    return AppThemeInputDecorationTheme._(
      labelStyle: appTheme.typoraphy.subtitleMedium.onBackground.textStyle,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.all(14),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.primary,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.primaryContainer,
          width: 2.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.pallete.cardBackground.darken(0.9).withOpacity(0.1),
          width: 2.0,
        ),
      ),
    );
  }
}

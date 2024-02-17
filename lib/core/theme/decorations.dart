import 'package:flutter/material.dart';

import 'package:bnf/core/theme/theme_extentions.dart';
import 'package:bnf/core/theme/theme_system.dart';

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
    required AppTheme appTheme,
    String? labelText,
    String? hintText,
    String? contentPadding,
    Widget? suffix,
  }) {
    return AppThemeInputDecoration._(
      labelText: labelText,
      hintText: hintText,
      labelStyle: appTheme.textTheme.subtitleMedium.onBackground.style,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.all(12),
      suffixIcon: suffix,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.primary,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.primaryContainer,
          width: 2.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color:
              appTheme.colorTheme.cardBackground.darken(0.9).withOpacity(0.1),
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.errorContainer,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.error,
          width: 2.0,
        ),
      ),
    );
  }

  factory AppThemeInputDecoration.onPrimaryBackground({
    required AppTheme appTheme,
    String? labelText,
    String? hintText,
    String? contentPadding,
    Widget? suffix,
  }) {
    return AppThemeInputDecoration._(
      labelText: labelText,
      hintText: hintText,
      labelStyle: appTheme.textTheme.subtitleMedium
          .withColor(
            appTheme.colorTheme.onSecondary,
          )
          .style,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.all(12),
      suffixIcon: suffix,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.onPrimary,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.primaryContainer,
          width: 2.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.onPrimary.darken(0.9).withOpacity(0.1),
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.errorContainer,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.error,
          width: 2.0,
        ),
      ),
    );
  }

  factory AppThemeInputDecoration.onSecondaryBackground({
    required AppTheme appTheme,
    String? labelText,
    String? hintText,
    String? contentPadding,
    Widget? suffix,
  }) {
    return AppThemeInputDecoration._(
      labelText: labelText,
      hintText: hintText,
      labelStyle: appTheme.textTheme.subtitleMedium
          .withColor(
            appTheme.colorTheme.onSecondary,
          )
          .style,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.all(12),
      suffixIcon: suffix,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.onSecondary,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.primaryContainer,
          width: 2.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.onSecondary.darken(0.9).withOpacity(0.1),
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.errorContainer,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.error,
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
    required AppTheme appTheme,
    String? labelText,
    String? hintText,
  }) {
    return AppThemeInputDecorationTheme._(
      labelStyle: appTheme.textTheme.subtitleMedium.onBackground.style,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.all(14),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.primary,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color: appTheme.colorTheme.primaryContainer,
          width: 2.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(
          color:
              appTheme.colorTheme.cardBackground.darken(0.9).withOpacity(0.1),
          width: 2.0,
        ),
      ),
    );
  }
}

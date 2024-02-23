import 'package:flutter/material.dart';

import 'package:rcp/core/theme/flex_theme_provider.dart';

const trendyTheme = CustomThemePallete(
  brightness: Brightness.light,
  primary: Color(0xff0062a1),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffd0e4ff),
  onPrimaryContainer: Color(0xff001d35),
  secondary: Color.fromARGB(255, 223, 162, 38),
  onSecondary: Color.fromARGB(255, 0, 0, 0),
  secondaryContainer: Color.fromARGB(255, 243, 194, 97),
  onSecondaryContainer: Color(0xff0f1d2a),
  tertiary: Color(0xff6a5779),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xfff1daff),
  onTertiaryContainer: Color(0xff241432),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  background: Color(0xfffdfcff),
  onBackground: Color(0xff1a1c1e),
  surface: Color(0xfffdfcff),
  onSurface: Color(0xff1a1c1e),
  surfaceVariant: Color(0xffdfe3eb),
  onSurfaceVariant: Color(0xff42474e),
  outline: Color(0xff73777f),
  outlineVariant: Color(0xffc2c7cf),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff2f3033),
  onInverseSurface: Color(0xfff1f0f4),
  inversePrimary: Color(0xff9ccaff),
  surfaceTint: Color(0xff0062a1),

  /// EXTRA

  cardBackground: Color(0xFFFAFAFA), // Off-white
  onCardBackground: Colors.black,

  chipBackground: Color(0xFF9E9E9E), // Gray
  onChipBackground: Colors.white,
  chipDisabledBackground: Color(0xFFBDBDBD), // Light gray
  onChipDisabledBackground: Colors.black87,

  success: Color(0xFF388E3C), // Dark green
  onSuccess: Colors.white,
  successContainer: Color(0xFFA5D6A7), // Light green
  onSuccessContainer: Colors.black,

  warning: Color(0xFFFF8F00), // Orange
  onWarning: Colors.black,
  warningContainer: Color(0xFFFFF59D), // Light yellow
  onWarningContainer: Colors.black,

  highlight: Color(0xFF9C27B0), // Deep purple
  onHighlight: Colors.white,

  backBtnBackground: Color.fromARGB(255, 181, 196, 231), // Deep orange
  onBackBtnBackground: Color.fromARGB(255, 31, 22, 87),
  navBackground: Color.fromARGB(255, 217, 241, 255), // Brown
  onNavBackground: Color.fromARGB(255, 20, 15, 86),
  onNavUnselected: Color(0xFF212121), // Dark gray
  onNavSelected: Color.fromARGB(255, 39, 112, 176), // Deep orange

  tabBarSelected: Color(0xFFFFA000), // Amber
  onTabBarSelected: Colors.black,
  tabBarUnselected: Color(0xFFE0E0E0), // Light gray
  onTabBarUnselected: Colors.black87,

  textFieldBackground: Color(0xFF009688), // Teal
  onTextFieldBackground: Colors.white,
);

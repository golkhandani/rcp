import 'package:flutter/material.dart';

import 'package:bnf/core/theme/dwew.dart';

const trendyTheme = CustomThemePallete(
  brightness: Brightness.light,
  primary: Color(0xFF6A0572), // Rich purple
  onPrimary: Colors.white,
  primaryContainer: Color(0xFFBE95C4), // Light purple
  onPrimaryContainer: Colors.black,

  secondary: Color(0xFF0277BD), // Deep blue
  onSecondary: Colors.white,
  secondaryContainer: Color(0xFF81D4FA), // Light blue
  onSecondaryContainer: Colors.black,

  cardBackground: Color(0xFFFAFAFA), // Off-white
  onCardBackground: Colors.black,

  tertiary: Color(0xFFD32F2F), // Red
  onTertiary: Colors.white,
  tertiaryContainer: Color(0xFFFFCDD2), // Light red
  onTertiaryContainer: Colors.black,

  chipBackground: Color(0xFF9E9E9E), // Gray
  onChipBackground: Colors.white,
  chipDisabledBackground: Color(0xFFBDBDBD), // Light gray
  onChipDisabledBackground: Colors.black87,

  error: Color(0xFFB00020), // Dark red
  onError: Colors.white,
  errorContainer: Color(0xFFEF9A9A), // Light red
  onErrorContainer: Colors.black,

  success: Color(0xFF388E3C), // Dark green
  onSuccess: Colors.white,
  successContainer: Color(0xFFA5D6A7), // Light green
  onSuccessContainer: Colors.black,

  warning: Color(0xFFFF8F00), // Orange
  onWarning: Colors.black,
  warningContainer: Color(0xFFFFF59D), // Light yellow
  onWarningContainer: Colors.black,

  background: Color(0xFFFFFFFF), // White
  onBackground: Colors.black,
  highlight: Color(0xFF9C27B0), // Deep purple
  onHighlight: Colors.white,

  shadow: Color(0xFF757575), // Gray
  surface: Color(0xFFEEEEEE), // Light gray
  onSurface: Colors.black,

  backBtnBackground: Color.fromARGB(255, 231, 181, 225), // Deep orange
  onBackBtnBackground: Color.fromARGB(255, 87, 22, 76),
  navBackground: Color.fromARGB(255, 137, 78, 140), // Brown
  onNavBackground: Colors.white,
  onNavUnselected: Color(0xFF212121), // Dark gray
  onNavSelected: Color.fromARGB(255, 204, 150, 238), // Deep orange

  tabBarSelected: Color(0xFFFFA000), // Amber
  onTabBarSelected: Colors.black,
  tabBarUnselected: Color(0xFFE0E0E0), // Light gray
  onTabBarUnselected: Colors.black87,

  textFieldBackground: Color(0xFF009688), // Teal
  onTextFieldBackground: Colors.white,
);

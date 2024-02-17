import 'package:flutter/material.dart';

import 'package:bnf/core/theme/theme_system.dart';

final blueTheme = AppColorTheme(
  brightness: Brightness.light,

  primary: const Color.fromARGB(255, 147, 163, 255),
  onPrimary: const Color.fromARGB(255, 255, 255, 255),
  primaryContainer: const Color.fromARGB(255, 152, 169, 202),
  onPrimaryContainer: const Color.fromARGB(255, 0, 0, 0),

  secondary: const Color.fromARGB(255, 85, 112, 199),
  onSecondary: Colors.white,
  secondaryContainer: const Color.fromARGB(255, 5, 13, 112),
  onSecondaryContainer: const Color.fromARGB(255, 255, 255, 255),

  cardBackground: const Color.fromARGB(255, 85, 112, 199),
  onCardBackground: Colors.white,

  tertiary: const Color.fromARGB(255, 112, 142, 184),
  onTertiary: const Color.fromARGB(255, 0, 0, 0),
  tertiaryContainer: const Color.fromARGB(255, 152, 169, 207),
  onTertiaryContainer: const Color.fromRGBO(255, 255, 255, 1),

  chipBackground: const Color.fromARGB(255, 112, 142, 184),
  onChipBackground: const Color.fromARGB(255, 0, 0, 0),
  chipDisabledBackground: const Color.fromARGB(255, 152, 169, 207),
  onChipDisabledBackground: const Color.fromRGBO(255, 255, 255, 1),

  error: Colors.red,
  onError: Colors.white,
  errorContainer: const Color.fromRGBO(141, 8, 41, 1),
  onErrorContainer: Colors.white,

  success: Colors.green,
  onSuccess: Colors.white,
  successContainer: const Color.fromRGBO(8, 141, 10, 1),
  onSuccessContainer: Colors.white,

  warning: Colors.amber,
  onWarning: Colors.white,
  warningContainer: const Color.fromARGB(255, 165, 125, 4),
  onWarningContainer: Colors.white,

  background: const Color.fromARGB(255, 255, 255, 255), // Set to white
  onBackground: const Color.fromRGBO(0, 0, 0, 1),
  highlight: const Color.fromRGBO(0, 0, 0, 1),
  onHighlight: const Color.fromRGBO(255, 255, 255, 1),

  shadow: const Color.fromRGBO(124, 128, 155, 0.5),
  surface: const Color.fromRGBO(0, 0, 0, 1),
  onSurface: const Color.fromRGBO(255, 255, 255, 1),

  navBackground: const Color.fromARGB(255, 122, 146, 225),
  onNavBackground: const Color.fromARGB(255, 255, 255, 255),
  onNavUnselected: const Color.fromARGB(255, 0, 0, 0),
  onNavSelected: const Color.fromARGB(255, 255, 255, 255),
  backBtnBackground: const Color.fromARGB(255, 85, 112, 199),
  onBackBtnBackground: Colors.white,

  tabBarSelected: const Color.fromARGB(255, 5, 13, 112),
  onTabBarSelected: const Color.fromARGB(255, 255, 255, 255),
  tabBarUnselected: const Color.fromARGB(255, 126, 145, 206),
  onTabBarUnselected: const Color.fromARGB(255, 0, 0, 0),

  textFieldBackground: const Color.fromARGB(255, 5, 13, 112),
  onTextFieldBackground: Colors.white,
);

final goldTheme = AppColorTheme(
  brightness: Brightness.light,

  primary: const Color.fromARGB(255, 255, 187, 0),
  onPrimary: const Color.fromARGB(255, 0, 0, 0),
  primaryContainer: const Color.fromARGB(255, 152, 169, 202),
  onPrimaryContainer: const Color.fromARGB(255, 0, 0, 0),

  secondary: const Color.fromARGB(255, 5, 106, 152),
  onSecondary: const Color.fromARGB(255, 255, 255, 255),
  secondaryContainer: const Color.fromARGB(255, 4, 75, 109),
  onSecondaryContainer: const Color.fromARGB(255, 255, 255, 255),

  cardBackground: const Color.fromARGB(255, 245, 230, 215),
  onCardBackground: const Color.fromARGB(255, 0, 0, 0),

  tertiary: const Color.fromARGB(255, 184, 112, 164),
  onTertiary: const Color.fromARGB(255, 0, 0, 0),
  tertiaryContainer: const Color.fromARGB(255, 255, 235, 183),
  onTertiaryContainer: const Color.fromARGB(255, 0, 0, 0),

  chipBackground: const Color.fromARGB(255, 250, 215, 133),
  onChipBackground: const Color.fromARGB(255, 0, 0, 0),
  chipDisabledBackground: const Color.fromARGB(255, 251, 237, 200),
  onChipDisabledBackground: const Color.fromARGB(255, 122, 121, 121),

  error: Colors.red,
  onError: Colors.white,
  errorContainer: const Color.fromRGBO(141, 8, 41, 1),
  onErrorContainer: Colors.white,

  success: Colors.green,
  onSuccess: Colors.white,
  successContainer: const Color.fromRGBO(8, 141, 10, 1),
  onSuccessContainer: Colors.white,

  warning: Colors.amber,
  onWarning: Colors.white,
  warningContainer: const Color.fromARGB(255, 165, 125, 4),
  onWarningContainer: Colors.white,

  background: const Color.fromARGB(255, 249, 246, 241), // Set to white
  onBackground: const Color.fromRGBO(0, 0, 0, 1),
  highlight: const Color.fromRGBO(0, 0, 0, 1),
  onHighlight: const Color.fromRGBO(255, 255, 255, 1),

  shadow: const Color.fromRGBO(124, 128, 155, 0.5),
  surface: const Color.fromRGBO(0, 0, 0, 1),
  onSurface: const Color.fromRGBO(255, 255, 255, 1),

  backBtnBackground: const Color.fromARGB(255, 209, 126, 2),
  onBackBtnBackground: const Color.fromARGB(255, 255, 255, 255),
  navBackground: const Color.fromARGB(255, 255, 172, 48),
  onNavBackground: const Color.fromARGB(255, 255, 255, 255),
  onNavUnselected: const Color.fromARGB(255, 0, 0, 0),
  onNavSelected: const Color.fromARGB(255, 255, 255, 255),

  tabBarSelected: const Color.fromARGB(255, 255, 176, 29),
  onTabBarSelected: const Color.fromARGB(255, 255, 255, 255),
  tabBarUnselected: const Color.fromARGB(255, 255, 227, 178),
  onTabBarUnselected: const Color.fromARGB(255, 105, 105, 105),

  textFieldBackground: const Color.fromARGB(255, 240, 158, 6),
  onTextFieldBackground: const Color.fromARGB(255, 0, 0, 0),
);

final pyd = AppColorTheme(
  brightness: Brightness.light,

  primary: const Color.fromARGB(255, 15, 163, 155),
  onPrimary: const Color.fromARGB(255, 0, 0, 0),
  primaryContainer: const Color.fromARGB(255, 152, 202, 194),
  onPrimaryContainer: const Color.fromARGB(255, 0, 0, 0),

  secondary: const Color.fromARGB(255, 175, 252, 229),
  onSecondary: const Color.fromARGB(255, 0, 0, 0),
  secondaryContainer: const Color.fromARGB(255, 33, 190, 162),
  onSecondaryContainer: const Color.fromARGB(255, 0, 0, 0),

  cardBackground: const Color.fromARGB(255, 215, 239, 245),
  onCardBackground: const Color.fromARGB(255, 0, 0, 0),

  tertiary: const Color.fromARGB(255, 112, 184, 171),
  onTertiary: const Color.fromARGB(255, 0, 0, 0),
  tertiaryContainer: const Color.fromARGB(255, 183, 255, 238),
  onTertiaryContainer: const Color.fromARGB(255, 0, 0, 0),

  chipBackground: const Color.fromARGB(255, 133, 250, 234),
  onChipBackground: const Color.fromARGB(255, 0, 0, 0),
  chipDisabledBackground: const Color.fromARGB(255, 200, 251, 248),
  onChipDisabledBackground: const Color.fromARGB(255, 122, 121, 121),

  error: Colors.red,
  onError: Colors.white,
  errorContainer: const Color.fromRGBO(141, 8, 41, 1),
  onErrorContainer: Colors.white,

  success: Colors.green,
  onSuccess: Colors.white,
  successContainer: const Color.fromRGBO(8, 141, 10, 1),
  onSuccessContainer: Colors.white,

  warning: Colors.amber,
  onWarning: Colors.white,
  warningContainer: const Color.fromARGB(255, 165, 125, 4),
  onWarningContainer: Colors.white,

  background: const Color.fromARGB(255, 241, 249, 249), // Set to white
  onBackground: const Color.fromRGBO(0, 0, 0, 1),
  highlight: const Color.fromRGBO(0, 0, 0, 1),
  onHighlight: const Color.fromRGBO(255, 255, 255, 1),

  shadow: const Color.fromRGBO(124, 128, 155, 0.5),
  surface: const Color.fromRGBO(0, 0, 0, 1),
  onSurface: const Color.fromRGBO(255, 255, 255, 1),

  backBtnBackground: const Color.fromARGB(255, 2, 209, 178),
  onBackBtnBackground: const Color.fromARGB(255, 255, 255, 255),
  navBackground: const Color.fromARGB(255, 86, 176, 158).withOpacity(0.8),
  onNavBackground: const Color.fromARGB(255, 0, 0, 0),
  onNavUnselected: const Color.fromARGB(255, 0, 0, 0),
  onNavSelected: const Color.fromARGB(255, 255, 255, 255),

  tabBarSelected: const Color.fromARGB(255, 20, 167, 138),
  onTabBarSelected: const Color.fromARGB(255, 255, 255, 255),
  tabBarUnselected: const Color.fromARGB(255, 171, 221, 216),
  onTabBarUnselected: const Color.fromARGB(255, 105, 105, 105),

  textFieldBackground: const Color.fromARGB(255, 67, 106, 96),
  onTextFieldBackground: const Color.fromARGB(255, 255, 255, 255),
);

final brown = AppColorTheme(
  brightness: Brightness.light,
  primary: const Color.fromARGB(255, 242, 189, 75),
  onPrimary: Colors.black,
  primaryContainer: const Color.fromRGBO(196, 187, 153, 1),
  onPrimaryContainer: Colors.white,

  secondary: const Color.fromARGB(255, 175, 228, 252),
  onSecondary: const Color.fromARGB(255, 0, 0, 0),
  secondaryContainer: const Color.fromARGB(255, 20, 135, 192),
  onSecondaryContainer: Colors.white,

  cardBackground: const Color.fromARGB(255, 245, 230, 215),
  onCardBackground: const Color.fromARGB(255, 0, 0, 0),

  tertiary: const Color.fromARGB(255, 199, 93, 22),
  onTertiary: Colors.white,
  tertiaryContainer: const Color.fromARGB(255, 255, 235, 183),
  onTertiaryContainer: const Color.fromARGB(255, 0, 0, 0),

  chipBackground: const Color.fromARGB(255, 250, 215, 133),
  onChipBackground: const Color.fromARGB(255, 0, 0, 0),
  chipDisabledBackground: const Color.fromARGB(255, 251, 237, 200),
  onChipDisabledBackground: const Color.fromARGB(255, 122, 121, 121),

  error: Colors.red,
  onError: Colors.white,
  errorContainer: const Color.fromRGBO(141, 8, 41, 1),
  onErrorContainer: Colors.white,

  success: Colors.green,
  onSuccess: Colors.white,
  successContainer: const Color.fromRGBO(8, 141, 10, 1),
  onSuccessContainer: Colors.white,

  warning: Colors.amber,
  onWarning: Colors.white,
  warningContainer: const Color.fromARGB(255, 165, 125, 4),
  onWarningContainer: Colors.white,

  background: const Color.fromARGB(255, 249, 246, 241), // Set to white
  onBackground: const Color.fromRGBO(0, 0, 0, 1),
  highlight: const Color.fromRGBO(0, 0, 0, 1),
  onHighlight: const Color.fromRGBO(255, 255, 255, 1),

  shadow: const Color.fromRGBO(124, 128, 155, 0.5),
  surface: const Color.fromRGBO(0, 0, 0, 1),
  onSurface: const Color.fromRGBO(255, 255, 255, 1),

  backBtnBackground: const Color.fromARGB(255, 209, 126, 2),
  onBackBtnBackground: const Color.fromARGB(255, 255, 255, 255),
  navBackground: const Color.fromARGB(255, 255, 232, 207),
  onNavBackground: const Color.fromARGB(255, 36, 31, 31),
  onNavUnselected: const Color.fromARGB(255, 0, 0, 0),
  onNavSelected: const Color.fromARGB(255, 186, 99, 0),

  tabBarSelected: const Color.fromARGB(255, 255, 176, 29),
  onTabBarSelected: const Color.fromARGB(255, 255, 255, 255),
  tabBarUnselected: const Color.fromARGB(255, 255, 227, 178),
  onTabBarUnselected: const Color.fromARGB(255, 105, 105, 105),

  textFieldBackground: const Color.fromARGB(255, 240, 158, 6),
  onTextFieldBackground: const Color.fromARGB(255, 0, 0, 0),
);

final trendyTheme = AppColorTheme(
  brightness: Brightness.light,
  primary: const Color(0xFF6A0572), // Rich purple
  onPrimary: Colors.white,
  primaryContainer: const Color(0xFFBE95C4), // Light purple
  onPrimaryContainer: Colors.black,

  secondary: const Color(0xFF0277BD), // Deep blue
  onSecondary: Colors.white,
  secondaryContainer: const Color(0xFF81D4FA), // Light blue
  onSecondaryContainer: Colors.black,

  cardBackground: const Color(0xFFFAFAFA), // Off-white
  onCardBackground: Colors.black,

  tertiary: const Color(0xFFD32F2F), // Red
  onTertiary: Colors.white,
  tertiaryContainer: const Color(0xFFFFCDD2), // Light red
  onTertiaryContainer: Colors.black,

  chipBackground: const Color(0xFF9E9E9E), // Gray
  onChipBackground: Colors.white,
  chipDisabledBackground: const Color(0xFFBDBDBD), // Light gray
  onChipDisabledBackground: Colors.black87,

  error: const Color(0xFFB00020), // Dark red
  onError: Colors.white,
  errorContainer: const Color(0xFFEF9A9A), // Light red
  onErrorContainer: Colors.black,

  success: const Color(0xFF388E3C), // Dark green
  onSuccess: Colors.white,
  successContainer: const Color(0xFFA5D6A7), // Light green
  onSuccessContainer: Colors.black,

  warning: const Color(0xFFFF8F00), // Orange
  onWarning: Colors.black,
  warningContainer: const Color(0xFFFFF59D), // Light yellow
  onWarningContainer: Colors.black,

  background: const Color(0xFFFFFFFF), // White
  onBackground: Colors.black,
  highlight: const Color(0xFF9C27B0), // Deep purple
  onHighlight: Colors.white,

  shadow: const Color(0xFF757575), // Gray
  surface: const Color(0xFFEEEEEE), // Light gray
  onSurface: Colors.black,

  backBtnBackground: const Color.fromARGB(255, 231, 181, 225), // Deep orange
  onBackBtnBackground: const Color.fromARGB(255, 87, 22, 76),
  navBackground: const Color.fromARGB(255, 137, 78, 140), // Brown
  onNavBackground: Colors.white,
  onNavUnselected: const Color(0xFF212121), // Dark gray
  onNavSelected: const Color.fromARGB(255, 204, 150, 238), // Deep orange

  tabBarSelected: const Color(0xFFFFA000), // Amber
  onTabBarSelected: Colors.black,
  tabBarUnselected: const Color(0xFFE0E0E0), // Light gray
  onTabBarUnselected: Colors.black87,

  textFieldBackground: const Color(0xFF009688), // Teal
  onTextFieldBackground: Colors.white,
);

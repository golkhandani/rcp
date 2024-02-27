import 'dart:async';

import 'package:flutter/material.dart';

import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/packages/components/notification_banner.dart';

class NotificationBannerService {
  final GlobalKey<NavigatorState> navigatorKey;
  NotificationBannerService(this.navigatorKey) {
    assert(navigatorKey.currentContext == null,
        'NavigatorState Context is not initialized!');
  }

  BuildContext get context => navigatorKey.currentContext!;

  Timer? _debounce;

  closeBanner() {
    final sf = ScaffoldMessenger.of(context);
    _debounce?.cancel();
    sf.hideCurrentMaterialBanner();
  }

  void _showCustomBanner({
    required String message,
    required TextStyle foregroundStyle,
    required Color backgroundColor,
  }) {
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) {
      return;
    }
    return showTopSnackBar(
      overlay,
      NotificationBanner(
        message: message,
        foregroundStyle: foregroundStyle,
        backgroundColor: backgroundColor,
      ),
      dismissType: DismissType.onSwipe,
      displayDuration: const Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  showErrorBanner(String message) {
    final foregroundStyle = context.typoraphyTheme.onError;
    final backgroundColor = context.colorTheme.error;

    _showCustomBanner(
      message: message,
      foregroundStyle: foregroundStyle.textStyle,
      backgroundColor: backgroundColor,
    );
  }

  showSuccessBanner(String message) {
    final foregroundStyle = context.typoraphyTheme.onSuccessContainer;
    final backgroundColor = context.customTheme.pallete.successContainer;

    _showCustomBanner(
      message: message,
      foregroundStyle: foregroundStyle.textStyle,
      backgroundColor: backgroundColor,
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:bnf/core/theme/dwew.dart';
import 'package:bnf/core/widgets/notification_banner.dart';

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

  showErrorBanner(String message) {
    final sf = ScaffoldMessenger.of(context);
    final foregroundStyle = context.typoraphyTheme.onErrorContainer;
    final backgroundColor = context.colorTheme.errorContainer;

    sf.showMaterialBanner(
      NotificationBanner(
        message: message,
        foregroundStyle: foregroundStyle.textStyle,
        backgroundColor: backgroundColor,
        closePressed: closeBanner,
      ),
    );
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 3000), () {
      closeBanner();
    });
  }

  showSuccessBanner(String message) {
    final sf = ScaffoldMessenger.of(context);
    final foregroundStyle = context.typoraphyTheme.onSuccessContainer.textStyle;
    final backgroundColor = context.customTheme.pallete.successContainer;

    sf.showMaterialBanner(
      NotificationBanner(
        message: message,
        foregroundStyle: foregroundStyle,
        backgroundColor: backgroundColor,
        closePressed: closeBanner,
      ),
    );
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 3000), () {
      closeBanner();
    });
  }
}

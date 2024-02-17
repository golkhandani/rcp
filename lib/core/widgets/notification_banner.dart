import 'package:flutter/material.dart';

class NotificationBanner extends MaterialBanner {
  NotificationBanner({
    super.key,
    required String message,
    required TextStyle foregroundStyle,
    required Color backgroundColor,
    VoidCallback? closePressed,
  }) : super(
          content: Text(
            message,
            style: foregroundStyle,
          ),
          backgroundColor: backgroundColor,
          actions: [
            if (closePressed != null)
              TextButton(
                onPressed: closePressed,
                child: Text(
                  'DISMISS',
                  style: foregroundStyle,
                ),
              ),
          ],
        );
}

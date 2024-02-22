import 'package:flutter/material.dart';

import 'package:rcp/core/widgets/card_container.dart';

class NotificationBanner extends StatelessWidget {
  final String message;
  final TextStyle foregroundStyle;
  final Color backgroundColor;
  const NotificationBanner({
    super.key,
    required this.message,
    required this.foregroundStyle,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CardContainer(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
        child: Text(
          message,
          style: foregroundStyle,
        ),
      ),
    );
  }
}

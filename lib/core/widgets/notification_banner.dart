import 'package:flutter/material.dart';

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
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 420,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: backgroundColor,
          ),
          child: Text(
            message,
            style: foregroundStyle,
            softWrap: true,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnimatedOpacityPositioned extends StatelessWidget {
  const AnimatedOpacityPositioned({
    super.key,
    this.top,
    this.left,
    this.bottom,
    this.right,
    required this.child,
    required this.maxHeight,
    required this.currentHeight,
  });

  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final double maxHeight;
  final double currentHeight;
  final Widget child;

  double opacityOf(double top) {
    return ((currentHeight - top) / (maxHeight - top)).clamp(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    if (currentHeight <= (top ?? maxHeight)) {
      return const SizedBox.shrink();
    }
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Opacity(
        opacity: opacityOf(top ?? maxHeight),
        child: child,
      ),
    );
  }
}

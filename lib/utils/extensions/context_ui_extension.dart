import 'package:flutter/material.dart';

extension BuildContextSizeHelper on BuildContext {
  Size get size => MediaQuery.sizeOf(this);

  double get vWidth => size.width;
  double get vHeight => size.height;
  bool get isNarrowWith => vWidth < (vHeight / 1.2);
  bool get isMediumWith => vWidth >= (vHeight / 1.2);
  bool get isWideWith => vWidth >= vHeight * 1.8;
  bool get isUltraWideWith => vWidth >= vHeight * 2;
}

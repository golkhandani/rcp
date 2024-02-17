import 'dart:ui';

import 'package:flutter/material.dart';

const kSliverFillSimpleLoading = SliverFillRemaining(
  child: Center(
    child: CircularProgressIndicator(),
  ),
);

const kSimpleLoading = Center(
  child: CircularProgressIndicator(),
);

const kErrorIcon = Icon(Icons.error);

final kStandardBlur = ImageFilter.blur(
  tileMode: TileMode.clamp,
  sigmaX: 10.0,
  sigmaY: 10.0,
);

final kBoxBorder = Border.all(
  color: Colors.black45,
  width: 1,
  style: BorderStyle.solid,
);

final kMediumBorderRadius = BorderRadius.circular(16);
final kSmallBorderRadius = BorderRadius.circular(16);

const double kRadius = 10;

const Duration kLoadingDuration = Duration(seconds: 2);

const kMediumPadding = EdgeInsets.all(16);
const kSmallPadding = EdgeInsets.all(12);
const kTinyPadding = EdgeInsets.all(8);

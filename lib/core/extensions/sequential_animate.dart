import 'package:flutter/widgets.dart';

import 'package:flutter_animate/flutter_animate.dart';

extension SequentialAnimateWidgetExtensions on Widget {
  Animate sequentialAnimate(int index) => animate(
        delay: Duration(milliseconds: index * 50),
      );
}

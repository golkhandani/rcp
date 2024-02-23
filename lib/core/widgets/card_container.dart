import 'package:flutter/material.dart';

import 'package:rcp/core/theme/flex_theme_provider.dart';

class CardContainer extends StatelessWidget {
  const CardContainer(
      {super.key,
      required this.child,
      this.padding = const EdgeInsets.all(24),
      this.color,
      this.borderRadius = BorderRadius.zero,
      this.hasShadow = false,
      this.width = double.infinity});

  final Widget child;
  final EdgeInsets padding;
  final Color? color;
  final BorderRadius borderRadius;
  final bool hasShadow;
  final double width;

  @override
  Widget build(BuildContext context) {
    final bg = color ?? context.colorTheme.tertiaryContainer;
    return RepaintBoundary(
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: bg,
          boxShadow: hasShadow
              ? <BoxShadow>[
                  BoxShadow(
                    offset: const Offset(-5, -5),
                    blurRadius: 16,
                    color: context.colorTheme.shadow,
                  )
                ]
              : null,
          borderRadius: borderRadius,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: color ?? context.colorTheme.tertiaryContainer,
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        offset: Offset(2.2, 2.2),
                        blurRadius: 10,
                        color: Colors.black,
                      )
                    ],
                    borderRadius: borderRadius,
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: padding,
                  child: child,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

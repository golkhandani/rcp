import 'package:flutter/material.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart' as intl;

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/packages/components/animated_opacity_positioned.dart';
import 'package:rcp/packages/components/back_button.dart';

extension TextSize on String? {
  Size textSize({TextStyle? style, double maxWidth = double.infinity}) {
    if (this == null || (this?.isEmpty ?? true)) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: this, style: style),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }
}

class ShoppingListSummaryHeader extends StatefulWidget {
  const ShoppingListSummaryHeader({
    super.key,
    required this.item,
    required this.onEditClicked,
    required this.onAddItemClicked,
  });

  final ShoppingList item;
  final VoidCallback onEditClicked;
  final VoidCallback? onAddItemClicked;

  @override
  State<ShoppingListSummaryHeader> createState() =>
      _ShoppingListSummaryHeaderState();
}

class _ShoppingListSummaryHeaderState extends State<ShoppingListSummaryHeader> {
  // Here it is!

  @override
  Widget build(BuildContext context) {
    const padding = 16.0;
    // fill the standard top space for headers
    final safeAreaHeight = context.topSafePadding;
    // covers back-button/actions
    const actionAreaHeight = 64.0;

    // calculate size of the title
    final titleStyleBig = context.typoraphyTheme.titleMedium;
    final titleStyleSmall = context.typoraphyTheme.titleSmall;
    final Size titleSize = widget.item.name.textSize(
      style: titleStyleBig.textStyle,
      maxWidth: context.vWidth,
    );
    final titleHeight = titleSize.height + padding;

    final descStyle = context.typoraphyTheme.subtitleLarge.onCardBackground;
    final descText = widget.item.description ?? '';
    final Size descSize = descText.textSize(
      style: descStyle.textStyle,
      maxWidth: context.vWidth,
    );
    final descriptionHeight = descText.isEmpty ? 0 : descSize.height + padding;

    final updateStyle = context.typoraphyTheme.subtitleMedium.onCardBackground;
    final updateText =
        'Last updated at ${intl.DateFormat.yMMMd().format(widget.item.updatedAt)} by ${widget.item.updatedBy.safeName}';
    final Size updateSize = updateText.textSize(
      style: updateStyle.textStyle,
      maxWidth: context.vWidth,
    );
    final updateHeight = updateSize.height + padding;

    final maxHeight = safeAreaHeight +
        actionAreaHeight +
        titleHeight +
        descriptionHeight +
        updateHeight;

    //
    final height = maxHeight;

    return SliverAppBar(
      forceElevated: true,
      pinned: true,
      elevation: 4,
      shadowColor: Colors.black45,
      backgroundColor: context.colorTheme.navBackground,
      toolbarHeight: actionAreaHeight,
      expandedHeight: maxHeight - actionAreaHeight + padding,
      automaticallyImplyLeading: false,
      leadingWidth: 48,
      flexibleSpace: CustomizableSpaceBar(
        builder: (context, sr) {
          final s = 2 * sr;
          final titleTop = safeAreaHeight +
              (padding * s).clamp(0, padding) +
              (actionAreaHeight * ((1 - s).clamp(0, 1)));

          final currentHeight = (1 - sr) * height;

          final c = currentHeight < titleTop
              ? context.colorTheme.navBackground
              : context.colorTheme.cardBackground;
          final f = currentHeight < titleTop
              ? context.colorTheme.onNavBackground
              : context.colorTheme.onCardBackground;

          final descriptionTop = titleTop + titleHeight;
          final updateTop = descriptionTop + descriptionHeight;

          final title = Text(
            widget.item.name,
            overflow: TextOverflow.ellipsis,
            maxLines: currentHeight < titleTop ? 1 : 2,
            style: (currentHeight < titleTop ? titleStyleSmall : titleStyleBig)
                .copyWithColor(color: f)
                .textStyle,
          );

          return Hero(
            tag: widget.item.id,
            child: AnimatedContainer(
              duration: 200.milliseconds,
              color: c,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: safeAreaHeight,
                    height: actionAreaHeight,
                    child: MyBackButton(
                      color: f,
                    ),
                  ),
                  Positioned(
                    top: safeAreaHeight,
                    right: padding,
                    height: actionAreaHeight,
                    child: UnconstrainedBox(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 32,
                        color: f,
                        icon: Icon(
                          Icons.edit_note,
                          color: f,
                        ),
                        onPressed: () => widget.onEditClicked(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: padding + (sr * 48),
                    top: titleTop,
                    right: padding + (sr * 48),
                    child: Row(
                      children: [
                        Expanded(
                          child: title,
                        ),
                        if (widget.onAddItemClicked != null) ...[
                          const Gap(16),
                          UnconstrainedBox(
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              iconSize: 32,
                              color: f,
                              icon: Icon(
                                Icons.add,
                                color: f,
                              ),
                              onPressed: () => widget.onAddItemClicked!(),
                            ),
                          ).animate().fadeIn(),
                        ],
                        const Gap(16),
                      ],
                    ),
                  ),

                  AnimatedOpacityPositioned(
                    top: descriptionTop,
                    left: padding,
                    maxHeight: descriptionTop + descriptionHeight,
                    currentHeight: currentHeight,
                    child: Text(
                      descText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: descStyle.textStyle,
                    ),
                  ),

                  // AnimatedOpacityPositioned(
                  //   top: membersTop,
                  //   left: leftPadding,
                  //   right: leftPadding,
                  //   maxHeight: height,
                  //   currentHeight: currentHeight,
                  //   child: SizedBox(
                  //     height: 48,
                  //     width: context.vWidth,
                  //     child: ListView(
                  //       scrollDirection: Axis.horizontal,
                  //       children: [
                  //         ...widget.item.participants.map(
                  //           (e) => Padding(
                  //             padding: const EdgeInsets.only(
                  //               right: 4,
                  //             ),
                  //             child: Chip(
                  //               color: MaterialStatePropertyAll(
                  //                 context.colorTheme.primary,
                  //               ),
                  //               labelPadding: EdgeInsets.zero,
                  //               label: Text(
                  //                 e.profile.safeName,
                  //                 style: context.typoraphyTheme.subtitleMedium
                  //                     .onPrimary.textStyle,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  AnimatedOpacityPositioned(
                    top: updateTop,
                    left: padding,
                    right: padding,
                    maxHeight: updateTop + updateHeight,
                    currentHeight: currentHeight,
                    child: Text(
                      updateText,
                      style: updateStyle.onCardBackground.textStyle,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

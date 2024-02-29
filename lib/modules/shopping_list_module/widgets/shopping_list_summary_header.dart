import 'package:flutter/material.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/packages/components/animated_opacity_positioned.dart';
import 'package:rcp/packages/components/back_button.dart';

class ShoppingListSummaryHeader extends StatefulWidget {
  const ShoppingListSummaryHeader({
    super.key,
    required this.item,
    required this.onEditClicked,
    required this.onAddItemClicked,
  });

  final ShoppingListModel item;
  final VoidCallback onEditClicked;
  final VoidCallback? onAddItemClicked;

  @override
  State<ShoppingListSummaryHeader> createState() =>
      _ShoppingListSummaryHeaderState();
}

class _ShoppingListSummaryHeaderState extends State<ShoppingListSummaryHeader> {
  @override
  Widget build(BuildContext context) {
    const leftPadding = 16.0;
    final safeAreaTop = context.topSafePadding + 16;
    const topHeight = 48;
    const titleHeight = 48;

    //
    final isLongDescription = (widget.item.description?.length ?? 0) > 50;
    final descriptionHeight = 16 + 12 * (isLongDescription ? 2 : 1);
    const membersHeight = 48;
    const updateHeight = 24;

    final maxHeight = safeAreaTop +
        topHeight +
        titleHeight +
        descriptionHeight +
        membersHeight +
        updateHeight;

    //
    final height = maxHeight;
    return SliverAppBar(
      forceElevated: true,
      pinned: true,
      elevation: 4,
      shadowColor: Colors.black45,
      backgroundColor: context.colorTheme.navBackground,
      toolbarHeight: 64 + context.topSafePadding,
      expandedHeight: height,
      automaticallyImplyLeading: false,
      flexibleSpace: CustomizableSpaceBar(
        builder: (context, sr) {
          final titleTop = safeAreaTop + (topHeight * (1 - sr));
          final descriptionTop = titleTop + titleHeight;
          final membersTop = descriptionTop + descriptionHeight;
          final updateTop = membersTop + membersHeight;

          final currentHeight = (1 - sr) * height;

          final c = currentHeight < titleTop
              ? context.colorTheme.navBackground
              : context.colorTheme.cardBackground;
          final f = currentHeight < titleTop
              ? context.colorTheme.onNavBackground
              : context.colorTheme.onCardBackground;
          return Hero(
            tag: widget.item.id,
            child: AnimatedContainer(
              duration: 200.milliseconds,
              color: c,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: safeAreaTop,
                    child: MyBackButton(
                      color: f,
                    ),
                  ),
                  Positioned(
                    left: leftPadding + (sr * 48),
                    top: titleTop,
                    right: leftPadding,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.item.name,
                            overflow: TextOverflow.ellipsis,
                            style: context.typoraphyTheme.titleMedium
                                .copyWithColor(color: f)
                                .textStyle,
                          ),
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
                        UnconstrainedBox(
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
                      ],
                    ),
                  ),
                  AnimatedOpacityPositioned(
                    top: descriptionTop,
                    maxHeight: height,
                    currentHeight: currentHeight,
                    left: leftPadding,
                    right: leftPadding,
                    child: Text(
                      widget.item.description ?? '-',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.typoraphyTheme.subtitleMedium
                          .onCardBackground.textStyle,
                    ),
                  ),
                  AnimatedOpacityPositioned(
                    top: membersTop,
                    left: leftPadding,
                    right: leftPadding,
                    maxHeight: height,
                    currentHeight: currentHeight,
                    child: SizedBox(
                      height: 48,
                      width: context.vWidth,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...widget.item.participants.map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(
                                right: 4,
                              ),
                              child: Chip(
                                color: MaterialStatePropertyAll(
                                  context.colorTheme.primary,
                                ),
                                labelPadding: EdgeInsets.zero,
                                label: Text(
                                  e.profile.safeName,
                                  style: context.typoraphyTheme.subtitleMedium
                                      .onPrimary.textStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedOpacityPositioned(
                    top: updateTop,
                    left: leftPadding,
                    right: leftPadding,
                    maxHeight: height,
                    currentHeight: currentHeight,
                    child: Text(
                      'Last updated at ${DateFormat.yMMMd().format(widget.item.updatedAt)} by ${widget.item.updatedBy}',
                      style: context
                          .typoraphyTheme.hint.onCardBackground.textStyle,
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

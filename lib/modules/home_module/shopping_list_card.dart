import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/widgets/constants.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/gen/assets.gen.dart';

final images = [
  Assets.images.shoppingList1.provider(),
  Assets.images.shoppingList2.provider(),
  Assets.images.shoppingList3.provider(),
  Assets.images.shoppingList4.provider(),
  Assets.images.shoppingItem1.provider(),
  Assets.images.shoppingItem2.provider(),
  Assets.images.shoppingItem3.provider(),
  Assets.images.shoppingItem4.provider(),
];

class ShoppingListCard extends StatefulWidget {
  const ShoppingListCard({
    super.key,
    required this.item,
    required this.isDeleting,
    required this.onDeleted,
    required this.onTap,
  });

  final ShoppingList item;
  final bool isDeleting;
  final VoidCallback onDeleted;
  final VoidCallback onTap;

  @override
  State<ShoppingListCard> createState() => _ShoppingListCardState();
}

class _ShoppingListCardState extends State<ShoppingListCard> {
  late bool _isDeleting = widget.isDeleting;
  bool isReady = true;

  final image = images[Random().nextInt(images.length - 1)];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ShoppingListCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isDeleting = widget.isDeleting;
  }

  @override
  Widget build(BuildContext context) {
    final isDeletable =
        widget.item.participants.length == 1 && widget.item.isOwner;
    return Hero(
      tag: widget.item.id,
      child: Card(
        elevation: 2.0,
        margin: const EdgeInsets.only(bottom: kMediumGap),
        color: context.colorTheme.cardBackground,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
              opacity: 1,
              scale: 0.1,
              filterQuality: FilterQuality.low,
            ),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: const GradientRotation(.2),
                colors: [
                  context.colorTheme.cardBackground,
                  context.colorTheme.cardBackground.withOpacity(0.8),
                ],
              ),
            ),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                dragDismissible: true,
                children: [
                  SlidableAction(
                    onPressed: (c) => widget.onDeleted(),
                    backgroundColor: context.colorTheme.error,
                    foregroundColor: context.colorTheme.onError,
                    icon: Icons.delete,
                    label: isDeletable ? 'Delete!' : 'Leave!',
                  ),
                ],
              ),
              child: InkWell(
                onTap: widget.onTap,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.name,
                              style: context.typoraphyTheme.titleSmall
                                  .onCardBackground.textStyle,
                            ),
                          ),
                          if (_isDeleting)
                            const SizedBox(
                              height: 24,
                              width: 24,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        widget.item.description ?? '-',
                        style: context.typoraphyTheme.subtitleMedium
                            .onCardBackground.textStyle,
                      ),
                      const SizedBox(height: 8.0),
                      if (widget.item.items.isNotEmpty && isReady) ...[
                        SizedBox(
                          height: 48,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...widget.item.items.take(2).map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Chip(
                                        labelPadding: EdgeInsets.zero,
                                        label: Text(
                                          e.name,
                                          style: context
                                              .typoraphyTheme
                                              .subtitleMedium
                                              .onCardBackground
                                              .textStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                              Chip(
                                label: Text(
                                  '...',
                                  style: context.typoraphyTheme.hint
                                      .onCardBackground.textStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                      if (widget.item.participants.isNotEmpty && isReady) ...[
                        SizedBox(
                          height: 48,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...widget.item.participants.take(2).map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Chip(
                                        color: MaterialStatePropertyAll(
                                          context.colorTheme.primary,
                                        ),
                                        labelPadding: EdgeInsets.zero,
                                        label: Text(
                                          e.profile.safeName,
                                          style: context
                                              .typoraphyTheme
                                              .subtitleMedium
                                              .onPrimary
                                              .textStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                              Chip(
                                color: MaterialStatePropertyAll(
                                  context.colorTheme.primary,
                                ),
                                label: Text(
                                  '...',
                                  style: context
                                      .typoraphyTheme.hint.onPrimary.textStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(height: 8.0),
                      Text(
                        'Last updated at ${DateFormat.yMMMd().format(widget.item.updatedAt)} by ${widget.item.updatedBy.safeName}',
                        style: context.typoraphyTheme.subtitleSmall
                            .onCardBackground.textStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

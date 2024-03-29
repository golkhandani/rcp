import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import 'package:rcp/core/models/shopping_item_model.dart';
import 'package:rcp/core/widgets/constants.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/gen/assets.gen.dart';

final images = [
  Assets.images.shoppingItem1.provider(),
  Assets.images.shoppingItem2.provider(),
  Assets.images.shoppingItem3.provider(),
  Assets.images.shoppingItem4.provider(),
];

class ShoppingItemCard extends StatefulWidget {
  const ShoppingItemCard({
    super.key,
    required this.item,
    required this.isDeleting,
    required this.onDeleted,
    required this.onCheckToggled,
    required this.onTap,
    required this.isUpdating,
  });

  final ShoppingItem item;
  final bool isDeleting;
  final bool isUpdating;
  final VoidCallback onDeleted;
  final VoidCallback onCheckToggled;
  final VoidCallback onTap;

  @override
  State<ShoppingItemCard> createState() => _ShoppingItemCardState();
}

class _ShoppingItemCardState extends State<ShoppingItemCard> {
  late bool _isPurchased = widget.item.isPurchased;
  late bool _isDeleting = widget.isDeleting;
  late bool _isUpdating = widget.isUpdating;
  final image = images[Random().nextInt(images.length - 1)];

  @override
  void didUpdateWidget(covariant ShoppingItemCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    _isDeleting = widget.isDeleting;
    _isUpdating = widget.isUpdating;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _isUpdating || _isDeleting,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.zero,
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
                  context.colorTheme.cardBackground.withOpacity(0.9),
                ],
              ),
            ),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                dragDismissible: true,
                children: [
                  SlidableAction(
                    onPressed: (c) {
                      setState(() {
                        _isDeleting = true;
                      });
                      widget.onDeleted();
                    },
                    backgroundColor: context.colorTheme.error,
                    foregroundColor: context.colorTheme.onError,
                    icon: Icons.delete,
                    label: 'Delete',
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
                              style: context.typoraphyTheme.titleMedium
                                  .onCardBackground.textStyle,
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild: Switch.adaptive(
                              activeColor: context.colorTheme.primary,
                              value: _isPurchased,
                              onChanged: (_) {
                                setState(() {
                                  _isUpdating = true;
                                  _isPurchased = !_isPurchased;
                                });
                                widget.onCheckToggled();
                              },
                            ),
                            secondChild: const Padding(
                              padding: EdgeInsets.all(kMediumGap),
                              child: SizedBox(
                                height: 24,
                                width: 24,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            crossFadeState: _isDeleting
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: 100.milliseconds,
                          ),
                        ],
                      ),
                      const SizedBox(height: kMediumGap),
                      if (widget.item.quantity != null)
                        Text(
                          widget.item.quantity!,
                          style: context.typoraphyTheme.subtitleLarge
                              .onCardBackground.textStyle,
                        ),
                      if (_isPurchased &&
                          widget.item.purchasedAt != null &&
                          widget.item.purchasedBy != null) ...[
                        const SizedBox(height: 16.0),
                        Text(
                          'Last purchased at ${DateFormat.yMMMd().format(widget.item.purchasedAt!)} by ${widget.item.purchasedBy!.safeName}',
                          style: context.typoraphyTheme.bodyMedium
                              .onCardBackground.textStyle,
                        )
                      ]
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

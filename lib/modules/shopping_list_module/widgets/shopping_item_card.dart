import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import 'package:rcp/core/models/shopping_item_model.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';

class ShoppingItemCard extends StatefulWidget {
  const ShoppingItemCard({
    super.key,
    required this.item,
    required this.isDeleting,
    required this.onDeleted,
    required this.onCheckToggled,
    required this.onTap,
  });

  final ShoppingItem item;
  final bool isDeleting;
  final VoidCallback onDeleted;
  final VoidCallback onCheckToggled;
  final VoidCallback onTap;

  @override
  State<ShoppingItemCard> createState() => _ShoppingItemCardState();
}

class _ShoppingItemCardState extends State<ShoppingItemCard> {
  late bool _isPurchased = widget.item.isPurchased;
  late bool _isDeleting = widget.isDeleting;

  @override
  void didUpdateWidget(covariant ShoppingItemCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isPurchased = widget.item.isPurchased;
    _isDeleting = widget.isDeleting;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      color: context.colorTheme.cardBackground,
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
                            _isPurchased = !_isPurchased;
                          });
                          widget.onCheckToggled();
                        },
                      ),
                      secondChild: const Padding(
                        padding: EdgeInsets.all(8.0),
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
                const SizedBox(height: 8.0),
                if (widget.item.quantity != null)
                  Text(
                    widget.item.quantity!,
                    style: context.typoraphyTheme.subtitleLarge.onCardBackground
                        .textStyle,
                  ),
                if (_isPurchased &&
                    widget.item.purchasedAt != null &&
                    widget.item.purchasedBy != null) ...[
                  const SizedBox(height: 16.0),
                  Text(
                    'Last purchased at ${DateFormat.yMMMd().format(widget.item.purchasedAt!)} by ${widget.item.purchasedBy!.safeName}',
                    style: context
                        .typoraphyTheme.bodyMedium.onCardBackground.textStyle,
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

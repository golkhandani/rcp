import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';

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

  @override
  void didUpdateWidget(covariant ShoppingListCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isDeleting = widget.isDeleting;
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.item.id,
      child: Card(
        elevation: 2.0,
        color: context.colorTheme.cardBackground,
        margin: const EdgeInsets.only(bottom: 16),
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
                  if (widget.item.items.isNotEmpty)
                    SizedBox(
                      height: 48,
                      width: context.vWidth,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...widget.item.items.take(5).map(
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
                  if (widget.item.participants.isNotEmpty)
                    SizedBox(
                      height: 48,
                      width: context.vWidth,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...widget.item.participants.take(5).map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Chip(
                                    color: MaterialStatePropertyAll(
                                      context.colorTheme.primary,
                                    ),
                                    labelPadding: EdgeInsets.zero,
                                    label: Text(
                                      e.profile.safeName,
                                      style: context.typoraphyTheme
                                          .subtitleMedium.onPrimary.textStyle,
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
                  const SizedBox(height: 8.0),
                  Text(
                    'Last updated at ${DateFormat.yMMMd().format(widget.item.updatedAt)} by ${widget.item.updatedBy.safeName}',
                    style: context.typoraphyTheme.subtitleSmall.onCardBackground
                        .textStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

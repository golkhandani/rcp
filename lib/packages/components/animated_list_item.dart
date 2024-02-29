import 'package:flutter/material.dart';

typedef RemovedItemBuilder<E> = Widget Function(
  E item,
  BuildContext context,
  Animation<double> animation,
);

class AnimatedListHandler<E> {
  AnimatedListHandler({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<E>? initialItems,
  }) : items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<SliverAnimatedListState> listKey;
  final RemovedItemBuilder<E> removedItemBuilder;
  final List<E> items;

  SliverAnimatedListState? get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    items.insert(index, item);
    _animatedList?.insertItem(index);
  }

  void insertAll(int index, int range, Iterable<E> addedItems) {
    items.insertAll(index, addedItems);
    _animatedList?.insertAllItems(index, range);
  }

  E removeAt(int index) {
    final E removedItem = items.removeAt(index);
    if (removedItem != null) {
      _animatedList?.removeItem(
        index,
        (BuildContext context, Animation<double> animation) =>
            removedItemBuilder(removedItem, context, animation),
        duration: Duration.zero,
      );
    }
    return removedItem;
  }

  int get length => items.length;

  E operator [](int index) => items[index];

  int indexOf(E item) => items.indexOf(item);
}

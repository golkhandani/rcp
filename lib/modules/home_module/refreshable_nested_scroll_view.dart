import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/widgets/constants.dart';

mixin RefreshableState {
  bool get isLoading => false;
  void onRefreshDone();
}

class RefreshableNestedScrollView extends StatefulWidget {
  final Widget? header;
  final void Function(RefreshableState handler)? onRefreshRequested;
  final void Function(RefreshableState handler)? onMoreRequested;
  final Widget Function(
    BuildContext context,
    RefreshableState handler,
  ) builder;

  final double topEdge;
  final double bottomEdge;
  const RefreshableNestedScrollView({
    super.key,
    required this.header,
    required this.onRefreshRequested,
    required this.onMoreRequested,
    required this.builder,
    this.topEdge = 100,
    this.bottomEdge = 100,
  });

  @override
  State<RefreshableNestedScrollView> createState() =>
      _RefreshableNestedScrollViewState();
}

class _RefreshableNestedScrollViewState
    extends State<RefreshableNestedScrollView> with RefreshableState {
  final ScrollController _scrollController = ScrollController();
  bool _pullToRefreshInProgress = false;
  double _pullToRefreshBoxHeight = 0;
  bool _pullToRefreshLocked = false;

  @override
  bool get isLoading => _pullToRefreshInProgress;
  @override
  void onRefreshDone() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _pullToRefreshBoxHeight = 0;
      });
    });
  }

  _handleMoreRequest(ScrollDirection direction, double offset) {
    if (widget.onMoreRequested == null) return;

    final maxTriggerExtend =
        _scrollController.position.maxScrollExtent - widget.bottomEdge;
    if (offset > maxTriggerExtend && direction == ScrollDirection.reverse) {
      widget.onMoreRequested!.call(this);
    }
  }

  _handlePullToRefresh(ScrollDirection direction, double offset) {
    if (widget.onRefreshRequested != null) {
      if (_pullToRefreshInProgress) {
        return;
      }

      if (_pullToRefreshLocked && direction == ScrollDirection.reverse) {
        setState(() {
          _pullToRefreshInProgress = false;
          _pullToRefreshLocked = false;
        });
      }

      if (_pullToRefreshLocked &&
          direction == ScrollDirection.forward &&
          offset > -widget.topEdge) {
        setState(() {
          _pullToRefreshInProgress = true;
        });
        widget.onRefreshRequested!.call(this);
        return;
      }

      if (offset < 0) {
        setState(() {
          _pullToRefreshBoxHeight = min(-offset, widget.topEdge / 2);
          _pullToRefreshLocked =
              _pullToRefreshLocked || offset < -widget.topEdge;
        });
      }

      if (offset > -widget.topEdge / 3) {
        setState(() {
          _pullToRefreshLocked = false;
        });
      }
    }
  }

  void _scrollHandler() {
    final offset = _scrollController.offset;
    final direction = _scrollController.position.userScrollDirection;
    _handleMoreRequest(direction, offset);

    _handlePullToRefresh(direction, offset);
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollHandler);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        if (widget.header != null) widget.header!,
        SliverPinnedHeader(
          child: AnimatedContainer(
            duration: 200.milliseconds,
            onEnd: () => {
              if (_pullToRefreshInProgress)
                {
                  setState(() {
                    _pullToRefreshInProgress = false;
                    _pullToRefreshLocked = false;
                  })
                }
            },
            height: _pullToRefreshBoxHeight,
            padding: const EdgeInsets.all(kLargeGap),
            child: FittedBox(
              fit: BoxFit.contain,
              child: _pullToRefreshInProgress
                  ? const Padding(
                      padding: EdgeInsets.all(kLargeGap),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : AnimatedRotation(
                      turns: _pullToRefreshLocked ? 0.5 : 0,
                      duration: 100.ms,
                      child: Icon(
                        Icons.arrow_circle_down_rounded,
                        size: widget.topEdge / 5,
                      ),
                    ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(kMediumGap).copyWith(
            bottom: kBottomGap + context.bottomSafePadding,
            top: 0,
          ),
          sliver: widget.builder(context, this),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:sliver_tools/sliver_tools.dart';

import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/packages/components/back_button.dart';

class SliverTitleBar extends StatelessWidget {
  final String title;
  final double? elevation;
  const SliverTitleBar({
    super.key,
    required this.title,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPinnedHeader(
      child: AppBar(
        scrolledUnderElevation: elevation ?? 4,
        elevation: elevation ?? 4,
        forceMaterialTransparency: false,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        toolbarOpacity: 1,
        toolbarHeight: 64,
        backgroundColor: context.colorTheme.navBackground,
        leading: const MyBackButton(),
        title: Text(
          title,
          style: context.typoraphyTheme.titleSmall.onNavBackground.textStyle,
        ),
        shadowColor: Colors.black26,
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  final String title;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const TitleBar({
    super.key,
    required this.title,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final elevate = backgroundColor == Colors.transparent && elevation == null
        ? elevation
        : 4.0;
    return AppBar(
      scrolledUnderElevation: elevate,
      elevation: elevate,
      forceMaterialTransparency: false,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      toolbarOpacity: 1,
      toolbarHeight: 64,
      backgroundColor: backgroundColor ?? context.colorTheme.navBackground,
      leading: MyBackButton(
        color: foregroundColor,
      ),
      title: Text(
        title,
        style: context.typoraphyTheme.titleSmall
            .copyWithColor(
              color: foregroundColor ?? context.colorTheme.onNavBackground,
            )
            .textStyle,
      ),
      shadowColor: Colors.black26,
    );
  }
}

class SliverTabBar extends StatefulWidget {
  final TabController? tabController;
  final List<Tab> tabs;

  const SliverTabBar({
    super.key,
    this.tabController,
    required this.tabs,
  });

  @override
  State<SliverTabBar> createState() => _SliverTabBarState();
}

class _SliverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _controller = widget.tabController ??
      TabController(
        length: widget.tabs.length,
        vsync: this,
      );
  @override
  Widget build(BuildContext context) {
    return SliverPinnedHeader(
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: context.colorTheme.navBackground,
        ),
        child: TabBar(
          indicatorWeight: 4,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: context.colorTheme.onNavUnselected,
          labelColor: context.colorTheme.onNavBackground,
          dividerColor: context.colorTheme.navBackground,
          unselectedLabelColor: context.colorTheme.onNavUnselected,
          dividerHeight: 4,
          controller: _controller,
          tabs: widget.tabs,
        ),
      ),
    );
  }
}

class TitleTabBar extends StatefulWidget {
  final TabController? tabController;
  final List<Tab> tabs;

  const TitleTabBar({
    super.key,
    this.tabController,
    required this.tabs,
  });

  @override
  State<TitleTabBar> createState() => _TitleTabBarState();
}

class _TitleTabBarState extends State<TitleTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _controller = widget.tabController ??
      TabController(
        length: widget.tabs.length,
        vsync: this,
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: context.colorTheme.navBackground,
      ),
      child: TabBar(
        indicatorWeight: 4,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: context.colorTheme.onNavUnselected,
        labelColor: context.colorTheme.onNavBackground,
        dividerColor: context.colorTheme.navBackground,
        unselectedLabelColor: context.colorTheme.onNavUnselected,
        dividerHeight: 4,
        controller: _controller,
        tabs: widget.tabs,
      ),
    );
  }
}

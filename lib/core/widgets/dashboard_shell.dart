import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:gap/gap.dart';

import 'package:bnf/core/theme/apptheme_elevated_button.dart';
import 'package:bnf/core/theme/theme_extentions.dart';
import 'package:bnf/utils/extensions/context_ui_extension.dart';

final kBlurConfig = ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0);

class DashboardLink {
  final IconData iconData;
  final String? label;
  final Color? color;
  final String routeName;
  final int index;
  DashboardLink({
    required this.iconData,
    this.label,
    this.color,
    required this.routeName,
    required this.index,
  });
}

class DashboardShell extends StatefulWidget {
  const DashboardShell({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.child,
    this.onTap,
    this.extendedWidth = 172,
    this.collapsedWidth = 72,
    this.height = 64,
    this.navBarMaxWidth = 400,
    this.contentBackgroundColor = Colors.blue,
    this.navigationBackgroundColor = Colors.black,
    this.navigationActiveColor = Colors.black,
    this.navigationInactiveColor = Colors.grey,
    this.safeAreaColor = Colors.red,
    this.useFloatingNavBar = true,
    this.borderRadius = 15,
    this.handleTopSafePadding = true,
    this.handleBottomSafePadding = false,
    this.floatingActionButton,
  });

  final double extendedWidth;
  final double collapsedWidth;
  final double height;
  final double navBarMaxWidth;
  final double borderRadius;

  final List<DashboardLink> items;
  final int currentIndex;
  final Widget child;
  final void Function(int)? onTap;

  final Color contentBackgroundColor;
  final Color navigationBackgroundColor;
  final Color navigationActiveColor;
  final Color navigationInactiveColor;
  final Color safeAreaColor;

  final bool useFloatingNavBar;
  final bool handleTopSafePadding;
  final bool handleBottomSafePadding;
  final Widget? floatingActionButton;

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ColorfulSafeArea(
        color: widget.safeAreaColor,
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: widget.contentBackgroundColor,
          resizeToAvoidBottomInset: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          persistentFooterAlignment: AlignmentDirectional.bottomEnd,
          body: _buildBodyContainer(),
          bottomNavigationBar: _buildBottomNavigationBar(),
          floatingActionButton:
              context.isNarrowWith ? widget.floatingActionButton : null,
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    // 1. if is not narrow -> will use rail navigator
    // 2. if use floating -> will be handled by body container
    return context.isNarrowWith && !widget.useFloatingNavBar
        ? _buildFixedNavigationBar()
        : const SizedBox.shrink();
  }

  Widget _buildBodyContainer() {
    return context.isNarrowWith
        ? _buildNarrowContainer()
        : _buildWideContainer();
  }

  Widget _buildNarrowContainer() {
    if (widget.useFloatingNavBar) {
      return Stack(
        children: [
          widget.child,
          Align(
            alignment: Alignment.bottomCenter,
            child: LimitedBox(
              maxWidth: widget.items.length * 120,
              child: _buildFloatingNavigationBar(),
            ),
          ),
        ],
      );
    }
    return widget.child;
  }

  Widget _buildWideContainer() {
    return Stack(
      children: [
        _buildRailContentWrapper(),
        _buildRailNavigationBar(),
      ],
    );
  }

  bool get _isRailExtended => context.isUltraWideWith;
  double get _railWidth => _isRailExtended ? 160 : 80;
  Widget _buildRailContentWrapper() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      top: 0,
      left: _railWidth,
      right: 0,
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - _railWidth,
        child: widget.child,
      ),
    );
  }

  Widget _buildRailNavigationBar() {
    return Positioned(
      top: 0,
      left: 0,
      bottom: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _railWidth,
        child: NavigationRail(
          backgroundColor: widget.navigationBackgroundColor,
          labelType: NavigationRailLabelType.none,
          extended: _isRailExtended,
          onDestinationSelected: widget.onTap,
          elevation: 4,
          groupAlignment: -1,
          unselectedIconTheme: IconThemeData(
            opacity: 100,
            color: widget.navigationInactiveColor,
          ),
          unselectedLabelTextStyle:
              TextStyle(color: widget.navigationInactiveColor),
          selectedIconTheme: IconThemeData(
            opacity: 100,
            color: widget.navigationInactiveColor,
          ),
          selectedLabelTextStyle: TextStyle(
            color: widget.navigationInactiveColor,
          ),
          destinations: widget.items.mapIndexed((i, e) {
            return NavigationRailDestination(
              icon: Icon(e.iconData),
              label: Text(e.label ?? ''),
            );
          }).toList(),
          selectedIndex: widget.currentIndex,
          minWidth: widget.collapsedWidth,
          minExtendedWidth: widget.extendedWidth,
          trailing: Expanded(
            child: Column(
              children: [
                const Spacer(),
                AnimatedScale(
                  scale: widget.floatingActionButton != null ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: AppThemeElevatedButton(
                    onPressed:
                        (widget.floatingActionButton as FloatingActionButton?)
                                ?.onPressed ??
                            () {},
                    child:
                        (widget.floatingActionButton as FloatingActionButton?)
                                ?.child ??
                            const SizedBox.shrink(),
                  ),
                ),
                const Gap(32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFixedNavigationBar() {
    return Container(
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: widget.navigationBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(2, 4), // changes position of shadow
          ),
        ],
      ),
      child: Theme(
        data: ThemeData(
          shadowColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          canvasColor: widget.navigationBackgroundColor,
        ),
        child: BottomNavigationBar(
          enableFeedback: true,
          backgroundColor: widget.navigationBackgroundColor,
          elevation: 0,
          items: widget.items
              .mapIndexed(
                (i, e) => BottomNavigationBarItem(
                  icon: Icon(
                    e.iconData,
                    color: i == widget.currentIndex
                        ? widget.navigationActiveColor
                        : widget.navigationInactiveColor,
                    size: (widget.height - 24) / 2,
                  ),
                  label: e.label,
                ),
              )
              .toList(),
          selectedItemColor: widget.navigationActiveColor,
          unselectedItemColor: widget.navigationInactiveColor,
          currentIndex: widget.currentIndex,
          showUnselectedLabels: true,
          onTap: widget.onTap,
          selectedLabelStyle:
              context.textTheme.subtitleMedium.onNavBackground.style,
          unselectedLabelStyle:
              context.textTheme.subtitleSmall.onNavBackground.style,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildFloatingNavigationBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(.2, .2),
            blurRadius: 1,
            color: context.colorTheme.shadow,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: BackdropFilter(
          filter: kBlurConfig,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            constraints: BoxConstraints(
              minHeight: widget.height,
              maxHeight: widget.height,
              maxWidth: widget.navBarMaxWidth,
            ),
            padding: EdgeInsets.only(
                right: widget.floatingActionButton != null ? 56 : 0),
            color: widget.navigationBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget.items.mapIndexed((i, e) {
                final isSelected = i == widget.currentIndex;
                final color = isSelected
                    ? widget.navigationActiveColor
                    : widget.navigationInactiveColor;
                final fontStyle = isSelected
                    ? context.textTheme.subtitleMedium
                    : context.textTheme.subtitleSmall;
                return GestureDetector(
                  onTap: () => widget.onTap?.call(i),
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Icon(
                          e.iconData,
                          color: color,
                          size: (widget.height - 24) / 2,
                        ),
                      ),
                      Text(
                        e.label ?? '',
                        style: fontStyle.copyWith(color: color).style.copyWith(
                              height: 1,
                            ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

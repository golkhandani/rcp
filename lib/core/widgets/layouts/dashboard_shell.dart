import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/widgets/constants.dart';
import 'package:rcp/core/widgets/theme/apptheme_elevated_button.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';

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
    this.useMobileFrameOnWideScreen = false,
  });

  final bool useMobileFrameOnWideScreen;
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
        topColor: widget.safeAreaColor,
        bottomColor: Colors.transparent,
        bottom: !widget.useFloatingNavBar,
        top: false,
        child: Scaffold(
          extendBody: false,
          extendBodyBehindAppBar: false,
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
    if (context.isNarrowWith) {
      return _buildNarrowContainer();
    } else if (widget.useMobileFrameOnWideScreen) {
      return BasicBackgroundContainer(
        child: MobileFrame(
          child: _buildNarrowContainer(),
        ),
      );
    } else {
      return _buildWideContainer();
    }
  }

  Widget _buildNarrowContainer() {
    if (widget.useFloatingNavBar) {
      final btm = MediaQuery.paddingOf(context).bottom;

      return Stack(
        children: [
          widget.child,
          Positioned(
            bottom: btm,
            right: 0,
            left: 0,
            child: _buildFloatingNavigationBar(),
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
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(),
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
                    size: (widget.height - 20) / 2,
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
              context.typoraphyTheme.subtitleMedium.onNavBackground.textStyle,
          unselectedLabelStyle:
              context.typoraphyTheme.subtitleSmall.onNavBackground.textStyle,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildFloatingNavigationBar() {
    final keyboard = MediaQuery.of(context).viewInsets.bottom;
    return AnimatedContainer(
      duration: 100.milliseconds,
      height: widget.height * (widget.height - keyboard).clamp(0, 1),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 2,
            color: Colors.black45,
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
              right: widget.floatingActionButton != null ? 56 : 0,
            ),
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
                    ? context.typoraphyTheme.titleTiny.textStyle
                    : context.typoraphyTheme.subtitleMedium.textStyle;
                return GestureDetector(
                  key: Key((isSelected.hashCode + i).toString()),
                  onTap: () => widget.onTap?.call(i),
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Icon(
                            e.iconData,
                            color: color,
                            size: (widget.height - 16) / 2,
                          ),
                        ),
                        Text(
                          e.label ?? '',
                          style: fontStyle.copyWith(
                            color: color,
                            height: 1,
                          ),
                        ),
                      ],
                    )
                        .animate(value: !isSelected ? 1 : 0)
                        .saturate()
                        .shake(hz: 2),
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

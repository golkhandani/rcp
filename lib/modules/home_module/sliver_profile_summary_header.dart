import 'dart:math';

import 'package:flutter/material.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/gen/assets.gen.dart';
import 'package:rcp/modules/profile_module/bloc/profile_state.dart';
import 'package:rcp/modules/profile_module/profile_module.dart';
import 'package:rcp/modules/shopping_list_module/widgets/shopping_list_summary_header.dart';
import 'package:rcp/modules/user_inbox_module/inbox_module.dart';

class SliverProfileSummaryHeader extends StatelessWidget {
  const SliverProfileSummaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const actionAreaHeight = 64.0;
    const padding = 16.0;

    return BlocBuilder<ProfileBloc, ProfileBlocState>(
      bloc: context.read(),
      builder: (context, state) {
        if (state.user == null) {
          return SliverAppBar(
            forceElevated: true,
            pinned: true,
            elevation: 4,
            shadowColor: Colors.black,
            backgroundColor: context.colorTheme.background,
            toolbarHeight: actionAreaHeight,
            expandedHeight: 92,
          );
        }
        final nameStyle = context.typoraphyTheme.titleMedium;
        final nameText = state.user?.profile.safeFullName ?? '';
        final nameSize = nameText.textSize(
          maxWidth: context.vWidth,
          style: nameStyle.textStyle,
        );

        return SliverAppBar(
          forceElevated: true,
          pinned: true,
          elevation: 2,
          shadowColor: Colors.black45,
          backgroundColor: context.colorTheme.cardBackground,
          toolbarHeight: actionAreaHeight,
          expandedHeight: actionAreaHeight + nameSize.height + padding,
          leadingWidth: 48,
          flexibleSpace: CustomizableSpaceBar(
            builder: (context, scrollingRate) {
              final bg =
                  context.colorTheme.navBackground.withOpacity(scrollingRate);

              final fg = bg.opacity < 0.5
                  ? context.colorTheme.onBackground
                  : context.colorTheme.onNavBackground;

              final avatarMaxRadius = max(
                36,
                actionAreaHeight * (1 - scrollingRate),
              ).toDouble();
              return AnimatedContainer(
                color: bg,
                padding: EdgeInsets.only(
                    top: context.topSafePadding + 16, bottom: 16),
                duration: const Duration(milliseconds: 200),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Gap(16),
                      GestureDetector(
                        onTap: () => context.goNamed(ProfileScreen.route.name),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            width: avatarMaxRadius,
                            child: CircleAvatar(
                              backgroundImage: state.user?.profile.avatarUrl ==
                                      null
                                  ? Assets.images.profilePlaceholder.provider()
                                  : NetworkImage(
                                      state.user!.profile.avatarUrl!,
                                    ), // // Replace with user avatar URL
                              radius: avatarMaxRadius,
                            ),
                          ),
                        ),
                      ),
                      const Gap(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: (1 - scrollingRate) * 24,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  'Welcome,',
                                  maxLines: 2,
                                  style: context.typoraphyTheme.subtitleLarge
                                      .copyWithColor(color: fg)
                                      .textStyle,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  nameText,
                                  maxLines: 2,
                                  style: nameStyle
                                      .copyWithColor(color: fg)
                                      .textStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => context.goNamed(inboxRoute.name),
                        icon: Icon(
                          Icons.notifications_outlined,
                          color: fg,
                        ),
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                      const Gap(16),
                    ]),
              );
            },
          ),
        );
      },
    );
  }
}

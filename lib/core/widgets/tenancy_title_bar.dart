import 'package:flutter/material.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/core/widgets/sliver_title_bar.dart';
import 'package:rcp/gen/assets.gen.dart';
import 'package:rcp/modules/app_bloc/group_tenancy_state.dart';
import 'package:rcp/modules/setting_module/profile_module.dart';

class TenancyTitleBar extends StatefulWidget {
  const TenancyTitleBar({
    super.key,
  });

  @override
  State<TenancyTitleBar> createState() => _TenancyTitleBarState();
}

class _TenancyTitleBarState extends State<TenancyTitleBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppTenancyBloc, AppTenancyState>(
      bloc: context.read(),
      builder: (context, state) {
        return TitleBar(title: state.selectedGroup?.name ?? '', elevation: 0);
      },
    );
  }
}

class UserSliverTitleBar extends StatefulWidget {
  const UserSliverTitleBar({super.key});

  @override
  State<UserSliverTitleBar> createState() => _UserSliverTitleBarState();
}

class _UserSliverTitleBarState extends State<UserSliverTitleBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppTenancyBloc, AppTenancyState>(
      bloc: context.read(),
      builder: (context, state) {
        if (state.user == null) {
          return const SliverTitleBar(title: '-');
        }
        return SliverAppBar(
          forceElevated: true,
          elevation: 2,
          backgroundColor: context.colorTheme.navBackground,
          toolbarHeight: 64,
          expandedHeight: 108,
          pinned: true,
          floating: false,
          flexibleSpace: CustomizableSpaceBar(
            builder: (context, scrollingRate) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (scrollingRate < 0.1)
                            FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                'Welcome,',
                                maxLines: 2,
                                style: context.typoraphyTheme.subtitleMedium
                                    .onNavBackground.textStyle,
                              ),
                            ),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              scrollingRate < 0.5
                                  ? state.user!.metadata.username
                                  : 'Date: ${state.selectedGroup?.name ?? ''}',
                              maxLines: 2,
                              style: context.typoraphyTheme.subtitleLarge
                                  .onNavBackground.textStyle,
                            ),
                          ),
                          if (scrollingRate < 0.5)
                            FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                'Date: ${state.selectedGroup?.name ?? ''}',
                                maxLines: 2,
                                style: context.typoraphyTheme.titleSmall
                                    .onNavBackground.textStyle,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.pushNamed(profileRoute.name),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: CircleAvatar(
                          backgroundImage:
                              state.user?.metadata.avatarUrl == null
                                  ? Assets.images.profilePlaceholder.provider()
                                  : NetworkImage(
                                      state.user!.metadata.avatarUrl!,
                                    ), // Replace with user avatar URL
                          radius: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

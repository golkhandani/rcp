import 'package:flutter/material.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:gap/gap.dart';

import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/gen/assets.gen.dart';

class SliverProfileHeader extends StatelessWidget {
  final String? username;
  final String? avatarUrl;
  final bool isLoadingAvatar;
  final VoidCallback onEditAvatarClicked;
  const SliverProfileHeader({
    super.key,
    this.avatarUrl,
    this.isLoadingAvatar = false,
    this.username,
    required this.onEditAvatarClicked,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      pinned: true,
      elevation: 20,
      shadowColor: Colors.black,
      backgroundColor: context.colorTheme.navBackground,
      toolbarHeight: 180,
      expandedHeight: 240,
      flexibleSpace: CustomizableSpaceBar(
        builder: (context, scrollingRate) {
          return Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onEditAvatarClicked,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Badge(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      backgroundColor: context.colorTheme.primary,
                      largeSize: 32,
                      alignment: Alignment.bottomRight,
                      offset: const Offset(0, -16),
                      label: Row(children: [
                        Icon(
                          Icons.edit,
                          size: 16,
                          color: context.colorTheme.onPrimary,
                        ),
                      ]),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: context.colorTheme.primary,
                            backgroundImage: avatarUrl == null
                                ? Assets.images.profilePlaceholder.provider()
                                : NetworkImage(avatarUrl!),
                            radius: 64,
                          ),
                          if (isLoadingAvatar)
                            Positioned.fill(
                              child: Container(
                                width: 64,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: context.colorTheme.background
                                      .withOpacity(0.8),
                                ),
                                child: const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(8),
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  username ?? '-',
                  maxLines: 1,
                  style: context.typoraphyTheme.titleMedium.primary.textStyle,
                ),
              ),
              const Gap(16)
            ],
          );
        },
      ),
    );
  }
}

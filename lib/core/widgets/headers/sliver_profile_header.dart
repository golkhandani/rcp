import 'package:flutter/material.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:gap/gap.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/gen/assets.gen.dart';

class SliverProfileHeader extends StatefulWidget {
  final String? username;
  final String? avatarUrl;
  final bool isLoadingAvatar;
  final bool isUpdating;
  final VoidCallback onEditAvatarClicked;
  final void Function() onEditClicked;
  final void Function() onDoneClicked;
  final bool isEditing;
  const SliverProfileHeader({
    super.key,
    this.avatarUrl,
    this.isLoadingAvatar = false,
    this.isUpdating = false,
    this.username,
    required this.onEditAvatarClicked,
    required this.onEditClicked,
    required this.onDoneClicked,
    this.isEditing = false,
  });

  @override
  State<SliverProfileHeader> createState() => _SliverProfileHeaderState();
}

class _SliverProfileHeaderState extends State<SliverProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      pinned: true,
      elevation: 4,
      shadowColor: Colors.black45,
      backgroundColor: context.colorTheme.cardBackground,
      toolbarHeight: 64,
      expandedHeight: 240,
      flexibleSpace: CustomizableSpaceBar(
        builder: (context, scrollingRate) {
          return Padding(
            padding:
                EdgeInsets.only(top: context.topSafePadding + 16, bottom: 16),
            child: Stack(
              children: [
                Positioned.fill(
                  top: 16,
                  child: Column(
                    children: [
                      Expanded(
                        child: MouseRegion(
                          cursor: widget.isEditing
                              ? SystemMouseCursors.click
                              : SystemMouseCursors.basic,
                          child: GestureDetector(
                            onTap: widget.isEditing
                                ? widget.onEditAvatarClicked
                                : null,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Badge(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                isLabelVisible: widget.isEditing,
                                backgroundColor:
                                    context.colorTheme.cardBackground,
                                largeSize: 32,
                                alignment: Alignment.bottomRight,
                                offset: const Offset(0, -16),
                                label: Row(children: [
                                  AnimatedOpacity(
                                    opacity: widget.isEditing ? 1 : 0,
                                    duration: const Duration(milliseconds: 400),
                                    child: Icon(
                                      Icons.edit,
                                      size: 16,
                                      color:
                                          context.colorTheme.onCardBackground,
                                    ),
                                  ),
                                ]),
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          context.colorTheme.primary,
                                      backgroundImage: widget.avatarUrl == null
                                          ? Assets.images.profilePlaceholder
                                              .provider()
                                          : NetworkImage(widget.avatarUrl!),
                                      radius: 64,
                                    ),
                                    if (widget.isLoadingAvatar)
                                      Positioned.fill(
                                        child: Container(
                                          width: 64,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: context.colorTheme.background
                                                .withOpacity(0.8),
                                          ),
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(8),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: BasicLinkButton(
                    foreground: context.colorTheme.onCardBackground,
                    labelText: widget.isUpdating
                        ? '...'
                        : widget.isEditing
                            ? 'Done'
                            : 'Edit',
                    onPressed: widget.isUpdating
                        ? () {}
                        : widget.isEditing
                            ? widget.onDoneClicked
                            : widget.onEditClicked,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:gap/gap.dart';

import 'package:rcp/core/theme/basic_widgets.dart';
import 'package:rcp/core/theme/flex_theme_provider.dart';
import 'package:rcp/gen/assets.gen.dart';
import 'package:rcp/utils/extensions/context_ui_extension.dart';

class SliverProfileHeader extends StatefulWidget {
  final String? username;
  final String? avatarUrl;
  final bool isLoadingAvatar;
  final bool isLoadingUsername;
  final VoidCallback onEditAvatarClicked;
  final void Function(String) onEditUsernameCompleted;
  const SliverProfileHeader({
    super.key,
    this.avatarUrl,
    this.isLoadingAvatar = false,
    this.isLoadingUsername = false,
    this.username,
    required this.onEditAvatarClicked,
    required this.onEditUsernameCompleted,
  });

  @override
  State<SliverProfileHeader> createState() => _SliverProfileHeaderState();
}

class _SliverProfileHeaderState extends State<SliverProfileHeader> {
  late String _username = widget.username ?? '-';
  late TextEditingController _usernameController =
      TextEditingController(text: _username);

  bool _editing = false;
  bool get _editingUsername => _editing || widget.isLoadingUsername;

  @override
  void didUpdateWidget(covariant SliverProfileHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    _username = widget.username ?? '-';
    _usernameController = TextEditingController(text: _username);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      pinned: true,
      elevation: 4,
      shadowColor: Colors.black45,
      backgroundColor: context.colorTheme.navBackground,
      toolbarHeight: 180,
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
                          cursor: _editing
                              ? SystemMouseCursors.click
                              : SystemMouseCursors.basic,
                          child: GestureDetector(
                            onTap: _editing ? widget.onEditAvatarClicked : null,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Badge(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                isLabelVisible: _editing,
                                backgroundColor:
                                    context.colorTheme.onNavBackground,
                                largeSize: 32,
                                alignment: Alignment.bottomRight,
                                offset: const Offset(0, -16),
                                label: Row(children: [
                                  AnimatedOpacity(
                                    opacity: _editing ? 1 : 0,
                                    duration: const Duration(milliseconds: 400),
                                    child: Icon(
                                      Icons.edit,
                                      size: 16,
                                      color: context.colorTheme.navBackground,
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
                                            child: CircularProgressIndicator
                                                .adaptive(),
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
                      AnimatedCrossFade(
                        firstChild: SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              _username,
                              maxLines: 1,
                              style: context
                                  .typoraphyTheme.onNavBackground.textStyle,
                            ),
                          ),
                        ),
                        secondChild: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: BasicTextInput(
                            fieldName: 'username_field',
                            controller: _usernameController,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        crossFadeState: !_editingUsername
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 200),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: BasicLinkButton(
                    foreground: context.colorTheme.onNavBackground,
                    labelText: _editing ? 'Done' : 'Edit',
                    onPressed: () {
                      if (_username != _usernameController.text) {
                        widget
                            .onEditUsernameCompleted(_usernameController.text);
                      }
                      setState(() {
                        _editing = !_editing;
                      });
                    },
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

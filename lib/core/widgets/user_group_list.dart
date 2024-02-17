import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bnf/core/models/group/group_model.dart';
import 'package:bnf/core/theme/apptheme_elevated_button.dart';
import 'package:bnf/core/theme/theme_extentions.dart';
import 'package:bnf/modules/group_module/bloc/group_cubit.dart';
import 'package:bnf/modules/group_module/bloc/group_state.dart';

class UserGroupList extends StatefulWidget {
  final GroupCubit groupCubit;
  final List<Group> list;
  final bool joined;
  const UserGroupList({
    super.key,
    required this.list,
    required this.groupCubit,
    required this.joined,
  });

  @override
  State<UserGroupList> createState() => _UserGroupListState();
}

class _UserGroupListState extends State<UserGroupList> {
  late final GroupCubit _groupCubit = widget.groupCubit;

  void _joinInvitedGroup(String groupId) {
    _groupCubit.joinInvitedGroup(groupId: groupId);
  }

  void _openJoinedGroup(String groupId) {
    _groupCubit.updateGroupId(groupId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupCubit, GroupState>(
      bloc: _groupCubit,
      builder: (context, state) {
        final btnStyle = widget.joined
            ? context.textTheme.subtitleMedium.onPrimary.style
            : context.textTheme.subtitleMedium.onSecondary.style;
        final btnText = widget.joined ? 'Open' : 'Join';
        final btnColor = widget.joined
            ? context.colorTheme.primary
            : context.colorTheme.secondary;

        return Column(
          children: widget.list.map((item) {
            return Container(
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: btnColor),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.only(left: 8),
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(child: Text(item.name)),
                  AppThemeElevatedButton(
                    background: btnColor,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (widget.joined) {
                        _openJoinedGroup(item.id);
                      } else {
                        _joinInvitedGroup(item.id);
                      }
                    },
                    child: Text(
                      btnText,
                      style: btnStyle,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

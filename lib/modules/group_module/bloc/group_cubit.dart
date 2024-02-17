import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:bnf/core/functions/create_new_group/index.dart';
import 'package:bnf/core/functions/get_user_groups/index.dart';
import 'package:bnf/core/functions/join_invited_goup/index.dart';
import 'package:bnf/core/ioc.dart';
import 'package:bnf/core/services/notification_banner_service.dart';
import 'package:bnf/modules/group_module/bloc/group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final SharedPreferences prefs;
  final SupabaseClient supabase;
  final NotificationBannerService banner;

  GroupCubit({
    required this.prefs,
    required this.supabase,
    required this.banner,
  }) : super(GroupState.init());

  createNewGroup({
    required String name,
    required String? imagePath,
    required List<String> groupMembers,
  }) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    try {
      // upload image
      final imageUrl = imagePath;

      // end upload image
      final createGroupInput = {
        'name': name,
        'imageUrl': imageUrl,
        'members': groupMembers,
      };

      final res = await supabase.functions
          .invoke(CreateNewGroupReq.fn, body: createGroupInput);
      final createdGroup = CreateNewGroupReq.fromJson(res.data);

      await updateGroupId(createdGroup.group.id);
    } on FunctionException catch (e) {
      locator.logger.error("createNewGroup -> FunctionException -> $e");
      rethrow;
    } finally {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }

  getGroups() async {
    emit(state.copyWith(
      isLoading: true,
    ));
    try {
      final res = await supabase.functions.invoke(GetUserGroupsReq.fn);
      locator.logger.info(res.data);
      final data = GetUserGroupsReq.fromJson(res.data);

      final joinedGroups = data.joinedGroups.map((e) => e.group).toList();
      final pendingGroups = data.invitedGroups.map((e) => e.group).toList();

      emit(state.copyWith(
        joinedGroups: joinedGroups,
        pendingGroups: pendingGroups,
      ));
    } on AuthException catch (e) {
      banner.showErrorBanner(e.message);
    } finally {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }

  joinInvitedGroup({required String groupId}) async {
    emit(state.copyWith(isLoading: true));
    try {
      final body = {
        'groupId': groupId,
      };
      final res =
          await supabase.functions.invoke(JoinInvitedGroupReq.fn, body: body);
      locator.logger.info(res.data);
      final data = JoinInvitedGroupReq.fromJson(res.data);

      final joinedGroup = data.joinedGroup;

      await updateGroupId(joinedGroup.group.id);
    } on AuthException catch (e) {
      banner.showErrorBanner(e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  updateGroupId(String groupId) async {
    emit(state.copyWith(groupId: groupId));
  }
}

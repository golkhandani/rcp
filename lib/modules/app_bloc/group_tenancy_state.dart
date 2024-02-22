import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/models/group/group_model.dart';
import 'package:rcp/core/models/user/user_data.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/environment.dart';

part 'group_tenancy_state.freezed.dart';
part 'group_tenancy_state.g.dart';

@freezed
class AppTenancyState with _$AppTenancyState {
  const factory AppTenancyState({
    required bool isLoading,
    String? selectedGroupId,
    Group? selectedGroup,
    UserInfo? user,
  }) = _AppTenancyState;

  factory AppTenancyState.init() => const AppTenancyState(
        isLoading: false,
      );
  factory AppTenancyState.fromJson(Map<String, Object?> json) =>
      _$AppTenancyStateFromJson(json);
}

class AppTenancyBloc extends Cubit<AppTenancyState> {
  final SharedPreferences prefs;
  final SupabaseClient supabase;
  final NotificationBannerService banner;

  AppTenancyBloc({
    required this.prefs,
    required this.supabase,
    required this.banner,
  }) : super(AppTenancyState.init());

  setCurrentGroup(String groupId, VoidCallback cb) async {
    await prefs.setString(Environment.selectedGroupKey, groupId);
    emit(state.copyWith(selectedGroupId: groupId));
    cb();
  }

  getCurrentGroup() async {
    emit(state.copyWith(isLoading: true));
    final date = DateFormat.yMMMd().format(DateTime.now());
    final tenant = Group(
      id: date,
      name: date,
      createdAt: date,
      updatedAt: date,
      createdBy: '-',
      updatedBy: '-',
    );
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(
      selectedGroupId: tenant.id,
      selectedGroup: tenant,
      isLoading: false,
    ));
  }
}

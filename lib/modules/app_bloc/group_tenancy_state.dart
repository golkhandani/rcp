import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:bnf/core/models/group/group_model.dart';
import 'package:bnf/core/models/user/user_data.dart';
import 'package:bnf/core/services/notification_banner_service.dart';
import 'package:bnf/environment.dart';
import 'package:bnf/utils/extensions/string_extensions.dart';

part 'group_tenancy_state.freezed.dart';
part 'group_tenancy_state.g.dart';

@freezed
class AppTenancyState with _$AppTenancyState {
  const factory AppTenancyState({
    required bool isLoading,
    String? selectedGroupId,
    Group? selectedGroup,
    UserData? user,
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

  getUserInfo() {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final userData = UserData(
      id: user.id,
      email: user.email,
      phone: user.phone,
      name: user.appMetadata['name'] ??
          user.email?.split('@')[0].toCapitalized() ??
          '-',
      imageUrl: user.appMetadata['imageUrl'] ??
          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D',
    );

    emit(state.copyWith(user: userData));
  }

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

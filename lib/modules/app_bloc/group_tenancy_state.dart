import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/models/user/user_data.dart';
import 'package:rcp/core/services/notification_banner_service.dart';

part 'group_tenancy_state.freezed.dart';
part 'group_tenancy_state.g.dart';

@freezed
class AppTenancyState with _$AppTenancyState {
  const factory AppTenancyState({
    required bool isLoading,
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
}

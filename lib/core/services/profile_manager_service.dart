import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/models/user_profile/index.dart';
import 'package:rcp/core/functions/users/handler.dart';
import 'package:rcp/core/ioc.dart';

class ProfileManagerService {
  final StackLogger _logger = locator.logger;
  final SupabaseClient _supabase;

  ProfileManagerService({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  User get user => _supabase.auth.currentUser!;
  bool? _hasValidProfile;
  UserProfile? _profile;
  UserProfile get profile =>
      _profile ??
      UserProfile(
        id: 'invalid',
        userId: user.id,
        username: user.email ?? user.id,
        fullName: user.email ?? user.id,
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
      );

  Future<bool> hasValidProfile({forceCheck = false}) async {
    if (_hasValidProfile == null || forceCheck) {
      _profile = await _getUserProfile();
      _hasValidProfile = _profile != null;
    }

    return _hasValidProfile!;
  }

  Future<UserProfile?> _getUserProfile() async {
    try {
      final userProfile = await _supabase.usersFunctions.userProfileGet();
      _profile = userProfile;
      return _profile;
    } catch (e) {
      _logger.warn("ProfileManagerService -> no profile found for user!");
      return null;
    }
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/users/handler.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/shopping_list_model.dart';

class ProfileManagerService {
  final StackLogger _logger = locator.logger;
  final SupabaseClient _supabase;

  ProfileManagerService({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  User get user => _supabase.auth.currentUser!;
  bool? _hasValidProfile;
  UserProfile2? _profile;
  UserProfile2 get profile =>
      _profile ??
      UserProfile2(
        id: 'invalid',
        userId: user.id,
        username: user.email ?? user.id,
        fullName: user.email ?? user.id,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  Future<bool> hasValidProfile({forceCheck = false}) async {
    if (_hasValidProfile == null || forceCheck) {
      _profile = await _getUserProfile();
      _hasValidProfile = _profile != null;
    }

    return _hasValidProfile!;
  }

  Future<UserProfile2?> _getUserProfile() async {
    try {
      if (_supabase.auth.currentSession == null) {
        return null;
      }
      final userProfile = await _supabase.usersFunctions.userProfileGet();
      _profile = userProfile;
      return _profile;
    } catch (e) {
      _logger.warn("ProfileManagerService -> no profile found for user!");
      return null;
    }
  }
}

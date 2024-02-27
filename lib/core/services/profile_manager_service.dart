import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/user_profile/index.dart';
import 'package:rcp/core/ioc.dart';

class ProfileManagerService {
  final StackLogger _logger = locator.logger;
  final SupabaseClient _supabase;

  ProfileManagerService({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  bool? _hasValidProfile;

  Future<bool> hasValidProfile({forceCheck = false}) async {
    if (_hasValidProfile == null || forceCheck) {
      _hasValidProfile = await _getUserProfile() != null;
    }

    return _hasValidProfile!;
  }

  Future<UserProfile?> _getUserProfile() async {
    try {
      final userProfile = await _supabase.userProfileGet();
      return userProfile;
    } catch (e) {
      _logger.warn("ProfileManagerService -> no profile found for user!");
      return null;
    }
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/users/invitations_functions.dart';
import 'package:rcp/core/functions/users/users_functions.dart';

extension UsersFunctionsExtension on SupabaseClient {
  UsersFunctions get usersFunctions => UsersFunctions(this);
  InvitationsFunctions get invitationsFunctions => InvitationsFunctions(this);
}

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/extentions.dart';
import 'package:rcp/core/functions/models/api_response.dart';
import 'package:rcp/core/functions/single_domain_functions.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/invitation_model.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/modules/app_bloc/list_query_state.dart';

class InvitationsFunctions extends SingleDomainFunctions {
  final _logger = locator.console('InvitationsFunctions');

  InvitationsFunctions(SupabaseClient supabaseClient)
      : super(
          'users',
          supabaseClient,
        );

  // invitations
  Future<InvitationCandidate?> userInvitationIsAvailable({
    required String email,
  }) async {
    try {
      final functionName = getfnName('invitation_is_available');
      final res = await supabaseClient.functions.get(
        functionName,
        query: {
          'email': email,
        },
      );

      final parsed = ApiResponse.tryParse<InvitationCandidate>(
        res.data,
        InvitationCandidate.fromJson,
      );

      return parsed.doc!;
    } on FunctionException catch (e) {
      if (e.status == 404) {
        return null;
      }
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
    }
  }

  Future<List<Invitation>> userInvitations({
    required ListQueryState query,
  }) async {
    try {
      final functionName = getfnName('me/invitations');
      final res = await supabaseClient.functions.get(
        functionName,
        query: query.toJson(),
      );

      final parsed = ApiResponse.tryParse<Invitation>(
        res.data,
        Invitation.fromJson,
      );

      return parsed.docs!;
    } on FunctionException catch (e) {
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
    }
  }
}

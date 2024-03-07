import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/extentions.dart';
import 'package:rcp/core/functions/models/api_response.dart';
import 'package:rcp/core/functions/single_domain_functions.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/participant_model.dart';

class ParticipantsFunctions extends SingleDomainFunctions {
  final _logger = locator.console('ParticipantsFunctions');

  ParticipantsFunctions(SupabaseClient supabaseClient)
      : super(
          'shopping_lists',
          supabaseClient,
        );

  // PARTICIPANTS
  Future<List<Participant>> getShoppingListParticipantsById(
    String id,
  ) async {
    try {
      final functionName = getfnName('$id/participants');

      final res = await supabaseClient.functions.get(
        functionName,
      );

      final parsed = ApiResponse.tryParse<Participant>(
        res.data,
        Participant.fromJson,
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

  Future<Participant> inviteShoppingListParticipantsById(
    String id, {
    required String userId,
    required String email,
  }) async {
    try {
      final functionName = getfnName('$id/participants');

      final res = await supabaseClient.functions.post(
        functionName,
        body: {
          "id": userId,
          "email": email,
        },
      );

      final parsed = ApiResponse.tryParse<Participant>(
        res.data,
        Participant.fromJson,
      );

      return parsed.doc!;
    } on FunctionException catch (e) {
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
    }
  }

  Future<Participant> acceptInvitationShoppingListById({
    required String shoppingListId,
    required String invitationId,
  }) async {
    try {
      final functionName =
          getfnName('$shoppingListId/participants/$invitationId/status');

      final res = await supabaseClient.functions.patch(
        functionName,
        body: {
          "status": ParticipantStatus.joined.name,
        },
      );
      final parsed = ApiResponse.tryParse<Participant>(
        res.data,
        Participant.fromJson,
      );

      return parsed.doc!;
    } on FunctionException catch (e) {
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
    }
  }

  Future<Participant> rejectInvitationShoppingListById({
    required String shoppingListId,
    required String invitationId,
  }) async {
    try {
      final functionName =
          getfnName('$shoppingListId/participants/$invitationId');

      final res = await supabaseClient.functions.delete(
        functionName,
      );

      final parsed = ApiResponse.tryParse<Participant>(
        res.data,
        Participant.fromJson,
      );

      return parsed.doc!;
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

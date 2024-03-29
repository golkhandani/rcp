import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/shopping_list/handler.dart';
import 'package:rcp/core/functions/users/handler.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/invitation_model.dart';
import 'package:rcp/core/services/notification_banner_service.dart';
import 'package:rcp/core/services/profile_manager_service.dart';
import 'package:rcp/modules/app_bloc/list_query_state.dart';

part 'invitation_bloc_state.freezed.dart';

@freezed
class InvitationBlocState with _$InvitationBlocState {
  const factory InvitationBlocState({
    required Map<String, bool> isUpdating,
    required bool isLoading,
    required ListQueryState queryState,
    required bool isPaginationDone,
    required List<Invitation> invitations,
  }) = _InvitationBlocState;

  factory InvitationBlocState.init() => const InvitationBlocState(
        isUpdating: {},
        isLoading: false,
        invitations: [],
        isPaginationDone: false,
        queryState: ListQueryState(),
      );
}

class InvitationBloc extends Cubit<InvitationBlocState> {
  final StackLogger _logger = locator.console('InvitationBloc');
  final SupabaseClient supabase;
  final ProfileManagerService profileManagerService;
  final NotificationBannerService banner;

  InvitationBloc({
    required this.supabase,
    required this.banner,
    required this.profileManagerService,
  }) : super(InvitationBlocState.init());

  Future<void> loadInvitations() async {
    try {
      if (state.isPaginationDone) {
        return;
      }

      emit(state.copyWith(isLoading: true));
      var query = state.queryState.copyWith(
        page: state.invitations.isEmpty ? 1 : state.queryState.page + 1,
      );
      final list = await supabase.invitationsFunctions.userInvitations(
        query: query,
      );

      emit(state.copyWith(
        queryState: query,
        isLoading: true,
        invitations: {
          ...state.invitations,
          ...list,
        }.toList(),
        isPaginationDone: list.length < query.pageSize,
      ));
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner('Something went wrong!');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> reloadInvitations() async {
    try {
      final newState = InvitationBlocState.init();
      final query = newState.queryState;
      final list = await supabase.invitationsFunctions.userInvitations(
        query: query,
      );
      emit(state.copyWith(
        isLoading: false,
        invitations: list,
      ));
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner('Something went wrong!');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> rejectInvitaton({
    required Invitation invitation,
  }) async {
    try {
      emit(state.copyWith(
        isUpdating: {
          ...state.isUpdating,
          invitation.id: true,
        },
      ));

      await supabase.participantsFunctions.rejectInvitationShoppingListById(
        invitationId: invitation.id,
        shoppingListId: invitation.shoppingList.id,
      );
      final updatedList = List<Invitation>.from(state.invitations)
        ..removeWhere(
          (item) => item.id == invitation.id,
        );
      emit(state.copyWith(
        isUpdating: {
          ...state.isUpdating,
          invitation.id: false,
        },
        invitations: updatedList,
      ));
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner('Something went wrong!');
    } finally {
      emit(state.copyWith(
        isUpdating: {
          ...state.isUpdating,
          invitation.id: false,
        },
      ));
    }
  }

  Future<void> acceptInvitaton({
    required Invitation invitation,
  }) async {
    try {
      emit(state.copyWith(
        isUpdating: {
          ...state.isUpdating,
          invitation.id: true,
        },
      ));

      await supabase.participantsFunctions.acceptInvitationShoppingListById(
        invitationId: invitation.id,
        shoppingListId: invitation.shoppingList.id,
      );

      final updatedList = List<Invitation>.from(state.invitations)
        ..removeWhere(
          (item) => item.id == invitation.id,
        );
      emit(state.copyWith(
        isUpdating: {
          ...state.isUpdating,
          invitation.id: false,
        },
        invitations: updatedList,
      ));
    } catch (e) {
      _logger.error(e);
      banner.showErrorBanner('Something went wrong!');
    } finally {
      emit(state.copyWith(
        isUpdating: {
          ...state.isUpdating,
          invitation.id: false,
        },
      ));
    }
  }
}

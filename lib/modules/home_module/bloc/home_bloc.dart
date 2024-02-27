import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/services/notification_banner_service.dart';

part 'home_bloc.freezed.dart';
part 'home_bloc.g.dart';

@freezed
class HomeBlocState with _$HomeBlocState {
  const factory HomeBlocState({
    required bool isLoading,
    required List<ShoppingListModel> shoppingLists,
  }) = _HomeBlocState;

  factory HomeBlocState.init() => const HomeBlocState(
        isLoading: false,
        shoppingLists: [],
      );
  factory HomeBlocState.fromJson(Map<String, Object?> json) =>
      _$HomeBlocStateFromJson(json);
}

class HomeBloc extends Cubit<HomeBlocState> {
  final StackLogger _logger = locator.console('HomeBloc');
  final SupabaseClient supabase;
  final NotificationBannerService banner;

  HomeBloc({
    required this.supabase,
    required this.banner,
  }) : super(HomeBlocState.init());

  loadShoppingLists() async {
    try {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(const Duration(milliseconds: 1000));
      final list = generateFakeShoppingListData(20);
      emit(state.copyWith(
        shoppingLists: list,
        isLoading: false,
      ));
    } catch (e) {
      _logger.error(e);
    }
  }
}

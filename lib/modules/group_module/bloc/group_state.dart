import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bnf/core/models/group/group_model.dart';

part 'group_state.freezed.dart';
part 'group_state.g.dart';

@freezed
class GroupState with _$GroupState {
  const factory GroupState({
    required bool isLoading,
    required List<Group> joinedGroups,
    required List<Group> pendingGroups,
    String? groupId,
  }) = _GroupState;

  factory GroupState.init() => const GroupState(
        isLoading: false,
        joinedGroups: [],
        pendingGroups: [],
      );
  factory GroupState.fromJson(Map<String, Object?> json) =>
      _$GroupStateFromJson(json);
}

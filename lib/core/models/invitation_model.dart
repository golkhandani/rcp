import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rcp/core/models/shopping_list_model.dart';

part 'invitation_model.freezed.dart';
part 'invitation_model.g.dart';

@freezed
class Invitation with _$Invitation {
  @JsonSerializable(explicitToJson: true)
  factory Invitation({
    required String id,
    required String userId,
    required String email,
    required String userProfileId,
    required String status,
    required DateTime invitedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    required ShoppingListSummary shoppingList,
    required UserProfile2 invitedBy,
    required UserProfile2 createdBy,
    required UserProfile2 updatedBy,
  }) = _Invitation;

  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);
}

@freezed
class ShoppingListSummary with _$ShoppingListSummary {
  @JsonSerializable(explicitToJson: true)
  factory ShoppingListSummary({
    required String id,
    required String name,
    String? description,
  }) = _ShoppingListSummary;

  factory ShoppingListSummary.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListSummaryFromJson(json);
}

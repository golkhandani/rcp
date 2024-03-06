import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/models/participant_model.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/core/widgets/theme/flex_theme_provider.dart';
import 'package:rcp/modules/shopping_list_module/bloc/shopping_list_bloc.dart';
import 'package:rcp/modules/shopping_list_module/widgets/shopping_list_participant_editor.dart';

class ShoppingListAddOrEdit extends StatefulWidget {
  const ShoppingListAddOrEdit({
    super.key,
    required this.shoppingListBloc,
    required this.shoppingList,
    this.shoppingListAdded,
    this.shoppingListUpdated,
  });

  final ShoppingListBloc shoppingListBloc;
  final ShoppingList? shoppingList;
  final void Function(ShoppingList)? shoppingListAdded;
  final void Function(ShoppingList)? shoppingListUpdated;

  @override
  State<ShoppingListAddOrEdit> createState() => _ShoppingListAddOrEditState();
}

class _ShoppingListAddOrEditState extends State<ShoppingListAddOrEdit> {
  late final _nameController = TextEditingController(
    text: widget.shoppingList?.name,
  );
  late final _descriptionController = TextEditingController(
    text: widget.shoppingList?.description,
  );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListBloc, ShoppingListBlocState>(
      bloc: widget.shoppingListBloc,
      buildWhen: (previous, current) {
        if (previous.shoppingList == null && current.shoppingList != null) {
          widget.shoppingListAdded?.call(current.shoppingList!);
        }

        if (previous.shoppingList != current.shoppingList &&
            current.shoppingList != null) {
          widget.shoppingListUpdated?.call(current.shoppingList!);
        }

        return true;
      },
      builder: (context, state) {
        final inviteds = state.participants
            .where((e) => e.status == ParticipantStatus.invited);

        final memebers = state.participants
            .where((e) => e.status == ParticipantStatus.joined);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              BasicTextInput(
                fieldName: 'shopping_list_name_field',
                controller: _nameController,
                hintText: 'Name',
              ),
              const Gap(8),
              BasicTextInput(
                fieldName: 'shopping_list_description_field',
                controller: _descriptionController,
                hintText: 'Description',
                maxLines: 3,
                maxLength: 100,
              ),
              const Gap(8),
              BasicElevatedButton(
                isLoading: state.isLoading,
                width: context.vWidth,
                labelText: state.shoppingList == null ? 'Add' : 'Update',
                onPressed: state.shoppingList == null
                    ? () => widget.shoppingListBloc.addShoppingList(
                          name: _nameController.text,
                          description: _descriptionController.text,
                        )
                    : () => widget.shoppingListBloc.updateShoppingList(
                          name: _nameController.text,
                          description: _descriptionController.text,
                        ),
              ),
              if (widget.shoppingList != null) ...[
                const Gap(16),
                Text(
                  'Add a new participant!',
                  style: context
                      .typoraphyTheme.titleTiny.onCardBackground.textStyle,
                ),
                const Gap(8),
                AddParticipantCard(
                  isLoading: state.isAddingItem,
                  list: state.invitationCandidates,
                  onEmailCheck: (email) =>
                      widget.shoppingListBloc.getUserProfileForInvitation(
                    email: email,
                  ),
                  onUserInvited: (p) => widget.shoppingListBloc.addParticipant(
                    candidate: p,
                  ),
                  isLoadingCandidates: state.isLoadingInvitationCandidates,
                ),
                const Gap(16),
                Text(
                  'Invited participants!',
                  style: context
                      .typoraphyTheme.titleTiny.onCardBackground.textStyle,
                ),
                if (inviteds.isEmpty)
                  Text(
                    'There is no invited participant!',
                    style: context.typoraphyTheme.subtitleSmall.onCardBackground
                        .textStyle,
                  ),
                ...inviteds.map((item) => CurrentParticipantCard(
                      isOwner: false,
                      participant: item,
                      onRemoved: () => widget.shoppingListBloc
                          .removeParticipant(participant: item),
                      isLoading: state.isDeletingItem[item.id] ?? false,
                    )),
                const Gap(16),
                Text(
                  'Current participants!',
                  style: context
                      .typoraphyTheme.titleTiny.onCardBackground.textStyle,
                ),
                if (memebers.isEmpty)
                  Text(
                    'There is no memeber participant!',
                    style: context.typoraphyTheme.subtitleSmall.onCardBackground
                        .textStyle,
                  ),
                ...memebers.map((item) => CurrentParticipantCard(
                      isOwner:
                          item.userId == state.shoppingList?.ownerId.userId,
                      participant: item,
                      onRemoved: () => widget.shoppingListBloc
                          .removeParticipant(participant: item),
                      isLoading: state.isDeletingItem[item.id] ?? false,
                    )),
                const Gap(32),
              ]
            ],
          ),
        );
      },
    );
  }
}

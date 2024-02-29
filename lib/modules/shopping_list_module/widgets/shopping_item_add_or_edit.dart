import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:rcp/core/extensions/context_ui_extension.dart';
import 'package:rcp/core/models/shopping_item_model.dart';
import 'package:rcp/core/widgets/theme/basic_widgets.dart';
import 'package:rcp/modules/shopping_list_module/bloc/shopping_list_bloc.dart';

class ShoppingItemAddOrEdit extends StatefulWidget {
  const ShoppingItemAddOrEdit({
    super.key,
    required this.shoppingItem,
    required this.shoppingListBloc,
  });

  final ShoppingItem? shoppingItem;
  final ShoppingListBloc shoppingListBloc;

  @override
  State<ShoppingItemAddOrEdit> createState() => _ShoppingItemAddOrEditState();
}

class _ShoppingItemAddOrEditState extends State<ShoppingItemAddOrEdit> {
  late final _nameController = TextEditingController(
    text: widget.shoppingItem?.name,
  );
  late final _quantityController = TextEditingController(
    text: widget.shoppingItem?.quantity,
  );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListBloc, ShoppingListBlocState>(
      bloc: widget.shoppingListBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              BasicTextInput(
                fieldName: 'shopping_item_name_field',
                controller: _nameController,
                hintText: 'Name',
              ),
              const Gap(8),
              BasicTextInput(
                fieldName: 'shopping_item_quantity_field',
                controller: _quantityController,
                hintText: 'Quantity',
                maxLines: 3,
                maxLength: 100,
              ),
              const Gap(8),
              BasicElevatedButton(
                isLoading: state.isAddingItem,
                width: context.vWidth,
                labelText: widget.shoppingItem == null ? 'Add' : 'Update',
                onPressed: state.isAddingItem
                    ? null
                    : () => widget.shoppingListBloc
                        .addOrUpdateShoppingItem(
                          id: widget.shoppingItem?.id,
                          name: _nameController.text.trim(),
                          quantity: _quantityController.text.trim(),
                        )
                        .then(
                          (_) => Navigator.pop(context),
                        ),
              ),
            ],
          ),
        );
      },
    );
  }
}

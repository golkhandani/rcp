## Patern

[Domain]--[FunctionNam]

### shopping_list

#### get_shopping_lists_by_user [mocked]

sort by updatedAt
sort by name
sort order
pagination
Auth.uid! == participant_user_id + joined

`shopping_list--get_shopping_lists_by_user`
Get shopping lists that user is a participant

#### get_shopping_list_by_id [mocked]

shopping_list_id!
Auth.uid! == participant_user_id + joined

`shopping_list--get_shopping_list_by_id`
Get shopping lists that user is a participant

#### add_or_update_shopping_list [mocked]

shopping_list_id?
name!
description?
Auth.uid! == created_by

`shopping_list--add_or_update_shopping_list`
Create a new shopping list
Update if the list is already exists with the same id

#### delete_shopping_list_by_id [mocked]

shopping_list_id!
name!
description?
Auth.uid! == created_by

`shopping_list--delete_shopping_list_by_id`
Delete a shopping list by id

---

### shopping_item

#### get_shopping_items_by_shopping_list

`shopping_item--get_shopping_items_by_shopping_list`

#### add_or_update_shopping_item

`shopping_item--add_or_update_shopping_item`

#### delete_shopping_item_by_id

`shopping_item--delete_shopping_item_by_id`

---

### Participants

#### add_invition_to_shopping_list

shopping_list_id!
invited_user_id!
Auth.uid! == participant_user_id + joined
`participants--add_invition_to_shopping_list`

Create new particpant record for user invited by other participants
It will be created as `invited` and will send a notification
to user

#### get_user_invitations

Auth.uid! == participant_user_id + invited
`participants--get_user_invitations`

Get list of shopping list that user is invited

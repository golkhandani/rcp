import { shoppingItemTable } from './../shared/models/shopping_item_model.ts';
import { getClientInfo } from '../shared/admin_client.ts';
import { ExpressRequest } from '../shared/anything.ts';
import {
	shoppingListSelect,
	shoppingListTable,
	ShoppingListWithoutIsOwner,
} from '../shared/models/shopping_list_model.ts';
import { participantTable } from '../shared/models/participant_model.ts';
import { ApiError } from '../shared/express_app.ts';
import { participantSelect } from '../shared/models/participant_model.ts';
import { Participant } from '../shared/models/participant_model.ts';
import { ShoppingList } from '../shared/models/shopping_list_model.ts';

export async function deleteShoppingListById(
	req: ExpressRequest,
): Promise<ShoppingList> {
	// Parse and validate inputs
	const id = req.params.id;
	if (!id) {
		throw new ApiError('Id is not valid!', 404);
	}

	// Get supabase client and required user data
	const { supabase, user } = await getClientInfo(req);

	// get the shopping list to check it user is the owner of the
	// shopping list or not
	const { data: existsShoppingList, error: eError } = await supabase.from(
		shoppingListTable,
	)
		.select(shoppingListSelect).eq(
			'id',
			id,
		).single<ShoppingListWithoutIsOwner>();

	if (!existsShoppingList || eError) {
		console.error(eError);
		throw new ApiError(
			'Cannot delete data! Please try again!',
			500,
			201500,
		);
	}

	// if user was owner
	// check if there is another participant
	// rather than the current owner or not
	// LEAVE vs DELETE
	const {
		data: otherParticipants,
		count: otherParticipantCount = 0,
		error: opcError,
	} = await supabase
		.from(
			participantTable,
		).select(participantSelect, { count: 'exact' }).neq('user_id', user.id)
		.eq('shopping_list_id', id)
		.returns<Participant[]>();

	if (opcError) {
		console.error(otherParticipantCount, opcError);
		throw new ApiError(
			'Cannot delete data! Please try again!',
			500,
			202500,
		);
	}

	// if owner is the only participant
	// remove owner=participant
	// remove shopping items belong to shoppingList
	// remove shoppingList
	const isOwner = user.id === existsShoppingList.owner.userId;
	const isOwnerOnlyParticipant = otherParticipantCount == 0;

	if (isOwner && isOwnerOnlyParticipant) {
		const { data: deletedOwner, error: deError } = await supabase.from(
			participantTable,
		).delete().eq(
			'user_id',
			user.id,
		).eq('shopping_list_id', id).select();

		if (!deletedOwner || deError) {
			console.error(deError);
			throw new ApiError(
				'Cannot delete data! Please try again!',
				500,
				203500,
			);
		}

		const { data: deletedItems, error: diError } = await supabase.from(
			shoppingItemTable,
		).delete().eq(
			'shopping_list_id',
			id,
		).select();

		// list can be empty so no need to check deletedItems
		if (diError) {
			console.error(diError, deletedItems);
			throw new ApiError(
				'Cannot delete data! Please try again!',
				500,
				204500,
			);
		}

		const { data: shoppingList, error: sError } = await supabase.from(
			shoppingListTable,
		)
			.delete().eq(
				'id',
				id,
			).select().single<ShoppingListWithoutIsOwner>();

		if (!shoppingList || sError) {
			console.error(sError);
			throw new ApiError(
				'Cannot delete data! Please try again!',
				500,
				205500,
			);
		}
		return { ...existsShoppingList, isOwner: false };
	}

	// if user is owner but not only participant in the list
	// change the owner to another participant
	if (isOwner && !isOwnerOnlyParticipant) {
		const anotherOwner = otherParticipants[1];
		const { data: updatedShoppingList, error: usError } = await supabase
			.from(
				shoppingListTable,
			)
			.update({
				'owner_id': anotherOwner.userId,
			}).eq(
				'id',
				id,
			).select().single();
		if (!updatedShoppingList || usError) {
			console.error(usError);
			throw new ApiError(
				'Cannot delete data! Please try again!',
				500,
				206500,
			);
		}
		const { data: deletedOwner, error: deError } = await supabase.from(
			participantTable,
		).delete().eq(
			'user_id',
			user.id,
		).eq('shopping_list_id', id).select();
		if (!deletedOwner || deError) {
			console.error(deError);
			throw new ApiError(
				'Cannot delete data! Please try again!',
				500,
				207500,
			);
		}
		return { ...existsShoppingList, isOwner: false };
	}

	// if user is not owner of the list simply delete the participant record
	// like user leave the list
	if (!isOwner) {
		const { data: deletedParticipant, error: dpError } = await supabase
			.from(
				participantTable,
			).delete().eq(
				'user_id',
				id,
			).eq('shopping_list_id', id).select();
		if (!deletedParticipant || dpError) {
			console.error(dpError);
			throw new ApiError(
				'Cannot delete data! Please try again!',
				500,
				208500,
			);
		}
		return { ...existsShoppingList, isOwner: false };
	}

	throw new ApiError(
		'Cannot delete data! Please try again!',
		500,
		209500,
	);
}

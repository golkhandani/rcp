import { ExpressRequest } from '../shared/anything.ts';

import { getClientInfo } from '../shared/admin_client.ts';
import {
	ShoppingListRow,
	shoppingListSelect,
	shoppingListTable,
} from '../shared/models/shopping_list_model.ts';
import { FunctionsError } from 'https://esm.sh/@supabase/supabase-js@2.39.3';
import { ShoppingList } from '../shared/models/shopping_list_model.ts';
import {
	ParticipantRow,
	participantSelect,
	ParticipantStatus,
} from '../shared/models/participant_model.ts';
import { FunctionException } from '../shared/exceptions/client_info_exception.ts';

export async function addShoppingListById(
	req: ExpressRequest,
): Promise<ShoppingList> {
	try {
		const { supabase, user, profile } = await getClientInfo(req);
		const body = req.body;
		const name = body.name;
		const description = body.description;
		const date = (new Date()).toISOString();
		const shoppingListInput: Omit<ShoppingListRow, 'id'> = {
			name: name,
			description: description,
			owner_id: user.id,
			//
			updated_at: date,
			updated_by: user.id,
			created_at: date,
			created_by: user.id,
		};

		const { data: insertedShoppingList, error } = await supabase.from(
			shoppingListTable,
		)
			.insert(
				shoppingListInput,
			).select(
				shoppingListSelect,
			).single();

		if (insertedShoppingList == null || error) {
			console.error(error);
			throw new FunctionsError(
				'Cannot create new shopping list, please try again!',
			);
		}

		const participant: Omit<ParticipantRow, 'id'> = {
			user_id: user.id,
			user_profile_id: profile.id,
			shopping_list_id: insertedShoppingList.id,
			user_email: user!.email!,
			status: ParticipantStatus.joined,
			invited_at: date,
			invited_by: user.id,
			//
			updated_at: date,
			updated_by: user.id,
			created_at: date,
			created_by: user.id,
		};

		const { data: insertedParticipant, error: participantError } =
			await supabase.from(
				'participants',
			)
				.insert(
					participant,
				).select(
					participantSelect,
				).single<ParticipantRow>();

		console.log(
			'insertedParticipant',
			insertedParticipant,
			participantError,
		);
		if (insertedParticipant == null) {
			// TODO(@golkhandani): revert the changes and remove insertedShoppingList
			throw new FunctionsError(
				'Cannot create new shopping list, please try again!' +
					participant.status,
			);
		}

		const result = {
			...insertedShoppingList,
			participants: [
				insertedParticipant,
				...insertedShoppingList.participants,
			],
		};

		return result as unknown as ShoppingList;
	} catch (error) {
		throw new FunctionException(error.message, error.status);
	}
}

export async function updateShoppingListById(
	req: ExpressRequest,
): Promise<ShoppingList> {
	try {
		const { supabase, user } = await getClientInfo(req);

		const body = req.body;
		const id = req.params.id;
		const name = body.name;
		const description = body.description;
		const date = (new Date()).toISOString();

		const { data: existsShoppingList, error: existsError } = await supabase
			.from(shoppingListTable).select('*').eq('id', id).single();
		if (existsShoppingList == null) {
			throw new FunctionsError('Shopping list not found!');
		}

		const shoppingListInput: Omit<ShoppingListRow, 'id'> = {
			...existsShoppingList,
			name: name,
			description: description,
			updated_at: date,
			updated_by: user.id,
		};

		const { data: insertedShoppingList, error } = await supabase.from(
			shoppingListTable,
		)
			.update(
				shoppingListInput,
			).eq('id', id)
			.select(shoppingListSelect).single();

		if (insertedShoppingList == null || error) {
			console.error(error);
			throw new FunctionsError(
				'Cannot create new shopping list, please try again!',
			);
		}

		return insertedShoppingList as unknown as ShoppingList;
	} catch (error) {
		throw new FunctionException(error.message, error.status);
	}
}

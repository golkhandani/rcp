import { ExpressRequest } from '../../anything.ts';
import { getClientInfo } from '../../admin_client.ts';
import {
	ShoppingListRow,
	shoppingListSelect,
	shoppingListTable,
} from '../../models/shopping_list_model.ts';
import { FunctionsError } from 'https://esm.sh/@supabase/supabase-js@2.39.3';
import {
	ShoppingList,
	ShoppingListWithoutIsOwner,
} from '../../models/shopping_list_model.ts';
import {
	Participant,
	ParticipantRow,
	participantSelect,
	ParticipantStatus,
} from '../../models/participant_model.ts';
import { FunctionException } from '../../exceptions/client_info_exception.ts';
import { participantTable } from '../../models/participant_model.ts';

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
			).single<ShoppingListWithoutIsOwner>();

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
				participantTable,
			)
				.insert(
					participant,
				).select(
					participantSelect,
				).single<Participant>();

		if (insertedParticipant == null) {
			// TODO(@golkhandani): revert the changes and remove insertedShoppingList
			throw new FunctionsError(
				'Cannot create new shopping list, please try again!' +
					participant.status,
			);
		}

		const result: ShoppingList = {
			...insertedShoppingList,
			isOwner: user.id == insertedShoppingList.owner.userId,
			participants: [
				insertedParticipant,
				...insertedShoppingList.participants,
			],
		};

		return result;
	} catch (error) {
		throw new FunctionException(error.message, error.status);
	}
}

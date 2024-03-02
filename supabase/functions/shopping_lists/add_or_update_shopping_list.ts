// @deno-types="npm:@types/express@4"
import { Request } from 'npm:express@4.18.2';
import pgDateParser from 'npm:postgres-date';
import { getClients, getUserProfile } from '../shared/admin_client.ts';
import {
	generateFakeShoppingListData,
	ShoppingListRow,
} from '../shared/models/shopping_list_model.ts';
import { FunctionsError } from 'https://esm.sh/@supabase/supabase-js@2.39.3';
import { Database } from '../types.ts';
import { ShoppingList } from '../shared/models/shopping_list_model.ts';
import { Participant } from '../shared/models/participant_model.ts';
export type ParticpantRow = Database['public']['Tables']['participants']['Row'];

export enum ParticipantStatus {
	joined = 'joined',
	invited = 'invited',
}

export async function addShoppingListById(
	req: Request,
): Promise<ShoppingList> {
	const { admin, supabase } = getClients(req);
	const { data: { user } } = await supabase.auth.getUser();

	const userProfile = await getUserProfile(req);

	const body = req.body;
	const name = body.name;
	const description = body.description;
	const date = (new Date()).toISOString();

	try {
		const shoppingListInput: Omit<ShoppingListRow, 'id'> = {
			name: name,
			description: description,
			owner_id: userProfile.userId,
			//
			updated_at: date,
			updated_by: userProfile.userId,
			created_at: date,
			created_by: userProfile.userId,
		};

		const { data: insertedShoppingList, error } = await supabase.from(
			'shopping_lists',
		)
			.insert(
				shoppingListInput,
			).select(
				`
				id: id,
				name: name,
				description: description,
				ownerId: owner_id (
					id: id,
					userId: user_id,
					username: username,
					fullName: full_name,
					avatarUrl: avatar_url,
					createdAt: created_at,
					updatedAt: updated_at
				),
				updatedAt: updated_at,
				updatedBy: updated_by (
					id: id,
					userId: user_id,
					username: username,
					fullName: full_name,
					avatarUrl: avatar_url,
					createdAt: created_at,
					updatedAt: updated_at
				),
				createdAt: created_at,
				createdBy: created_by (
					id: id,
					userId: user_id,
					username: username,
					fullName: full_name,
					avatarUrl: avatar_url,
					createdAt: created_at,
					updatedAt: updated_at
				),
				participants: participants(*)
				
				`,
			).single();

		if (insertedShoppingList == null || error) {
			console.error(error);
			throw new FunctionsError(
				'Cannot create new shopping list, please try again!',
			);
		}

		const participant: Omit<ParticpantRow, 'id'> = {
			user_id: userProfile.userId,
			user_profile_id: userProfile.id,
			shopping_list_id: insertedShoppingList.id,
			user_email: user!.email!,
			status: ParticipantStatus.joined,
			invited_at: date,
			invited_by: userProfile.userId,
			//
			updated_at: date,
			updated_by: userProfile.userId,
			created_at: date,
			created_by: userProfile.userId,
		};

		const { data: insertedParticipant, error: participantError } =
			await supabase.from(
				'participants',
			)
				.insert(
					participant,
				).select(
					`
				id: id,
				userId: user_id,
				email: user_email,
				profile: user_profile_id (
					id: id,
					userId: user_id,
					username: username,
					fullName: full_name,
					avatarUrl: avatar_url,
					createdAt: created_at,
					updatedAt: updated_at
				),
				shoppingListId: shopping_list_id,
				status: status,
				invitedAt: invited_at,
				invitedBy: invited_by (
					id: id,
					userId: user_id,
					username: username,
					fullName: full_name,
					avatarUrl: avatar_url,
					createdAt: created_at,
					updatedAt: updated_at
				),
				createdAt: created_at,
				createdBy: created_by (
					id: id,
					userId: user_id,
					username: username,
					fullName: full_name,
					avatarUrl: avatar_url,
					createdAt: created_at,
					updatedAt: updated_at
				),
				updatedAt: updated_at,
				updatedBy: updated_by (
					id: id,
					userId: user_id,
					username: username,
					fullName: full_name,
					avatarUrl: avatar_url,
					createdAt: created_at,
					updatedAt: updated_at
				)
				`,
				).single<ParticpantRow>();

		console.log(
			'insertedParticipant',
			insertedParticipant,
			participantError,
		);
		if (insertedParticipant == null) {
			// TODO: revert the changes and remove insertedShoppingList
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
			items: [],
		};

		console.log(result);
		return result as unknown as ShoppingList;
	} catch (error) {
		console.error(error);
		throw new FunctionsError(error);
	}
}

export async function updateShoppingListById(
	req: Request,
): Promise<ShoppingList> {
	const { admin, supabase } = getClients(req);
	const { data: { user } } = await supabase.auth.getUser();

	const userProfile = await getUserProfile(req);

	const body = req.body;
	const id = body.id;
	const name = body.name;
	const description = body.description;
	const date = (new Date()).toISOString();

	try {
		const { data: existsShoppingList, error: existsError } = await supabase
			.from('shopping_lists').select('*').eq('id', id).single();
		if (existsShoppingList == null) {
			throw new FunctionsError('Shopping list not found!');
		}

		const shoppingListInput: Omit<ShoppingListRow, 'id'> = {
			...existsShoppingList,
			name: name,
			description: description,
			updated_at: date,
			updated_by: userProfile.userId,
		};

		const { data: insertedShoppingList, error } = await supabase.from(
			'shopping_lists',
		)
			.update(
				shoppingListInput,
			).eq('id', id)
			.select(
				`
				id: id,
				name: name,
				description: description,
				ownerId: owner_id (
					id: id,
					userId: user_id,
					username: username,
					fullName: full_name,
					avatarUrl: avatar_url,
					createdAt: created_at,
					updatedAt: updated_at
				),
				updatedAt: updated_at,
				updatedBy: updated_by (
					id: id,
					userId: user_id,
					username: username,
					fullName: full_name,
					avatarUrl: avatar_url,
					createdAt: created_at,
					updatedAt: updated_at
				),
				createdAt: created_at,
				createdBy: created_by (
					id: id,
					userId: user_id,
					username: username,
					fullName: full_name,
					avatarUrl: avatar_url,
					createdAt: created_at,
					updatedAt: updated_at
				),
				participants: participants(
					id: id,
					userId: user_id,
					email: user_email,
					profile: user_profile_id (
						id: id,
						userId: user_id,
						username: username,
						fullName: full_name,
						avatarUrl: avatar_url,
						createdAt: created_at,
						updatedAt: updated_at
					),
					shoppingListId: shopping_list_id,
					status: status,
					invitedAt: invited_at,
					invitedBy: invited_by (
						id: id,
						userId: user_id,
						username: username,
						fullName: full_name,
						avatarUrl: avatar_url,
						createdAt: created_at,
						updatedAt: updated_at
					),
					createdAt: created_at,
					createdBy: created_by (
						id: id,
						userId: user_id,
						username: username,
						fullName: full_name,
						avatarUrl: avatar_url,
						createdAt: created_at,
						updatedAt: updated_at
					),
					updatedAt: updated_at,
					updatedBy: updated_by (
						id: id,
						userId: user_id,
						username: username,
						fullName: full_name,
						avatarUrl: avatar_url,
						createdAt: created_at,
						updatedAt: updated_at
					)
				)
				
				`,
			).single();

		if (insertedShoppingList == null || error) {
			console.error(error);
			throw new FunctionsError(
				'Cannot create new shopping list, please try again!',
			);
		}

		const result = {
			...insertedShoppingList,
			items: [],
		};

		console.log(result);
		return result as unknown as ShoppingList;
	} catch (error) {
		console.error(error);
		throw new FunctionsError(error);
	}
}

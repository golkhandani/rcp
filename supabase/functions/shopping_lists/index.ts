import { ExpressApp } from './../shared/anything.ts';
import { BasicException } from './../shared/exceptions/client_info_exception.ts';

import { updateShoppingListById } from './updateShoppingListById.ts';
import { addShoppingListById } from './addShoppingListById.ts';
import { deleteShoppingListById } from './deleteShoppingListById.ts';
import { getShoppingListById } from './getShoppingListById.ts';
import { getShoppingListParticipantsById } from './getShoppingListParticipantsById.ts';
import { getShoppingListsByUser } from './getShoppingListsByUser.ts';

import { addOrUpdateShoppingItem } from '../shopping_items/add_or_update_shopping_item.ts';

import { togglePurchasedShoppingItem } from '../shopping_items/add_or_update_shopping_item.ts';
import { deleteShoppingItemById } from '../shopping_items/delete_shopping_item_by_id.ts';
import { getShoppingItemsByShoppingList } from '../shopping_items/get_shopping_items_by_shopping_list.ts';
import { expressApp } from '../shared/anything.ts';
import {
	addShoppingListParticipantsById,
	deleteShoppingListParticipantsById,
	updateStatusShoppingListParticipantsById,
} from '../participants/add_participant.ts';
import { sendDataResponse, sendErrorResponse } from '../shared/express_app.ts';

// [clean up is done]
expressApp((app: ExpressApp) => {
	const prefix = 'shopping_lists';

	app.get(`/${prefix}/all`, async (req, res) => {
		try {
			const result = await getShoppingListsByUser(req);
			return sendDataResponse(res, result, 200);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	app.get(`/${prefix}/:id`, async (req, res) => {
		try {
			const result = await getShoppingListById({ req });
			return sendDataResponse(res, result, 200);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	app.post(`/${prefix}`, async (req, res) => {
		try {
			const result = await addShoppingListById(req);
			return sendDataResponse(res, result, 201);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	app.put(`/${prefix}/:id`, async (req, res) => {
		try {
			const result = await updateShoppingListById(req);
			return sendDataResponse(res, result, 200);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	app.delete(`/${prefix}/:id`, async (req, res) => {
		try {
			const result = await deleteShoppingListById(req);
			return sendDataResponse(res, result, 204);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	////////////////
	// [clean up is todo]
	// PARTICIPANTS
	// some of the endpoints can be moved to participant prefix
	// like delete/put/patch-status
	app.get(`/${prefix}/:id/participants`, async (req, res) => {
		try {
			const result = await getShoppingListParticipantsById(req);
			return res.status(200).send(result);
		} catch (error) {
			if (error instanceof BasicException) {
				return res.status(error.status).send({ error: error.message });
			}
			return res.status(500).send({ error: 'Something is wrong!' });
		}
	});

	// TODO(@golkhandani): add new participant to the list
	app.post(`/${prefix}/:id/participants`, async (req, res) => {
		try {
			const result = await addShoppingListParticipantsById(req);
			return res.status(200).send(result);
		} catch (error) {
			if (error instanceof BasicException) {
				return res.status(error.status).send({ error: error.message });
			}
			return res.status(500).send({ error: 'Something is wrong!' });
		}
	});

	// when a user joined a shopping list we need to update the status from
	// invited to joined
	app.patch(
		`/${prefix}/:id/participants/:participantId/status`,
		async (req, res) => {
			try {
				const result = await updateStatusShoppingListParticipantsById(
					req,
				);
				return res.status(200).send(result);
			} catch (error) {
				if (error instanceof BasicException) {
					return res.status(error.status).send({
						error: error.message,
					});
				}
				return res.status(500).send({ error: 'Something is wrong!' });
			}
		},
	);

	app.delete(
		`/${prefix}/:id/participants/:participantId`,
		async (req, res) => {
			try {
				const result = await deleteShoppingListParticipantsById(req);
				return res.status(204).send(result);
			} catch (error) {
				if (error instanceof BasicException) {
					return res.status(error.status).send({
						error: error.message,
					});
				}
				return res.status(500).send({ error: 'Something is wrong!' });
			}
		},
	);

	////////////////
	// [clean up is todo]
	// SHOPPING ITEMS
	app.get(`/${prefix}/:id/items`, async (req, res) => {
		try {
			const result = await getShoppingItemsByShoppingList(req);
			return res.status(200).send(result);
		} catch (error) {
			if (error instanceof BasicException) {
				return res.status(error.status).send({ error: error.message });
			}
			return res.status(500).send({ error: 'Something is wrong!' });
		}
	});

	app.post(`/${prefix}/:id/items`, async (req, res) => {
		try {
			const result = await addOrUpdateShoppingItem(req);
			return res.status(201).send(result);
		} catch (error) {
			if (error instanceof BasicException) {
				return res.status(error.status).send({ error: error.message });
			}
			return res.status(500).send({ error: 'Something is wrong!' });
		}
	});

	app.put(`/${prefix}/:id/items/:shoppingItemId`, async (req, res) => {
		try {
			const result = await addOrUpdateShoppingItem(req);
			return res.status(200).send(result);
		} catch (error) {
			if (error instanceof BasicException) {
				return res.status(error.status).send({ error: error.message });
			}
			return res.status(500).send({ error: 'Something is wrong!' });
		}
	});

	app.patch(
		`/${prefix}/:id/items/:shoppingItemId/purchased`,
		async (req, res) => {
			try {
				const result = await togglePurchasedShoppingItem(req);
				return res.status(200).send(result);
			} catch (error) {
				if (error instanceof BasicException) {
					return res.status(error.status).send({
						error: error.message,
					});
				}
				return res.status(500).send({ error: 'Something is wrong!' });
			}
		},
	);

	app.delete(
		`/${prefix}/:id/items/:shoppingItemId`,
		async (req, res) => {
			try {
				const result = await deleteShoppingItemById(req);
				return res.status(204).send(result);
			} catch (error) {
				if (error instanceof BasicException) {
					return res.status(error.status).send({
						error: error.message,
					});
				}
				return res.status(500).send({ error: 'Something is wrong!' });
			}
		},
	);
});

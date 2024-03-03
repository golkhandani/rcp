import { ExpressApp } from './../shared/anything.ts';
import { BasicException } from './../shared/exceptions/client_info_exception.ts';

import {
	addShoppingListById,
	updateShoppingListById,
} from './add_or_update_shopping_list.ts';
import { deleteShoppingListById } from './delete_shopping_list_by_id.ts';
import {
	getShoppingListById,
	getShoppingListParticipantsById,
} from './get_shopping_list_by_id.ts';
import { getShoppingListsByUser } from './get_shopping_lists_by_user.ts';

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

expressApp((app: ExpressApp) => {
	const prefix = 'shopping_lists';

	app.get(`/${prefix}/all`, async (req, res) => {
		try {
			const result = await getShoppingListsByUser(req);
			return res.status(200).send(result);
		} catch (error) {
			if (error instanceof BasicException) {
				return res.status(error.status).send({
					error: error.message,
				});
			}
			return res.status(500).send({ error: 'Something is wrong!' });
		}
	});

	app.get(`/${prefix}/:id`, async (req, res) => {
		try {
			const result = await getShoppingListById(req);
			return res.status(200).send(result);
		} catch (error) {
			if (error instanceof BasicException) {
				return res.status(error.status).send({ error: error.message });
			}
			return res.status(500).send({ error: 'Something is wrong!' });
		}
	});

	app.post(`/${prefix}`, async (req, res) => {
		try {
			const result = await addShoppingListById(req);
			return res.status(201).send(result);
		} catch (error) {
			if (error instanceof BasicException) {
				return res.status(error.status).send({ error: error.message });
			}
			return res.status(500).send({ error: 'Something is wrong!' });
		}
	});

	app.put(`/${prefix}/:id`, async (req, res) => {
		try {
			const result = await updateShoppingListById(req);
			return res.status(200).send(result);
		} catch (error) {
			if (error instanceof BasicException) {
				return res.status(error.status).send({ error: error.message });
			}
			return res.status(500).send({
				error: 'Something is wrong!',
				c: error,
			});
		}
	});

	app.delete(`/${prefix}/:id`, async (req, res) => {
		try {
			const result = await deleteShoppingListById(req);
			return res.status(204).send(result);
		} catch (error) {
			if (error instanceof BasicException) {
				return res.status(error.status).send({ error: error.message });
			}
			return res.status(500).send({ error: 'Something is wrong!' });
		}
	});

	////////////////
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

import { ExpressApp } from './../shared/anything.ts';
import { BasicException } from './../shared/exceptions/client_info_exception.ts';

import { updateShoppingListById } from '../shared/routes/shoppingLists/updateShoppingListById.ts';
import { addShoppingListById } from '../shared/routes/shoppingLists/addShoppingListById.ts';
import { deleteShoppingListById } from '../shared/routes/shoppingLists/deleteShoppingListById.ts';
import { getShoppingListById } from '../shared/routes/shoppingLists/getShoppingListById.ts';
import { getShoppingListParticipantsById } from '../shared/routes/participants/getShoppingListParticipantsById.ts';
import { getShoppingListsByUser } from '../shared/routes/shoppingLists/getShoppingListsByUser.ts';

import { addOrUpdateShoppingItem } from '../shared/routes/shoppingItems/addOrUpdateShoppingItem.ts';

import { togglePurchasedShoppingItem } from '../shared/routes/shoppingItems/togglePurchasedShoppingItem.ts';
import { deleteShoppingItemById } from '../shared/routes/shoppingItems/deleteShoppingItemById.ts';
import { getShoppingItemsByShoppingList } from '../shared/routes/shoppingItems/getShoppingItemsByShoppingList.ts';
import { expressApp } from '../shared/anything.ts';

import { deleteShoppingListParticipantsById } from '../shared/routes/participants/deleteShoppingListParticipantsById.ts';
import { updateStatusShoppingListParticipantsById } from '../shared/routes/participants/updateStatusShoppingListParticipantsById.ts';
import { sendDataResponse, sendErrorResponse } from '../shared/express_app.ts';
import { addShoppingListParticipantsById } from '../shared/routes/participants/addShoppingListParticipantsById.ts';

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
	//#region PARTICIPANTS

	// some of the endpoints can be moved to participant prefix
	// like delete/put/patch-status
	app.get(`/${prefix}/:id/participants`, async (req, res) => {
		try {
			const result = await getShoppingListParticipantsById(req);
			return sendDataResponse(res, result, 200);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	app.post(`/${prefix}/:id/participants`, async (req, res) => {
		try {
			const result = await addShoppingListParticipantsById(req);
			return sendDataResponse(res, result, 201);
		} catch (error) {
			return sendErrorResponse(res, error);
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
				return sendDataResponse(res, result, 200);
			} catch (error) {
				return sendErrorResponse(res, error);
			}
		},
	);

	app.delete(
		`/${prefix}/:id/participants/:participantId`,
		async (req, res) => {
			try {
				const result = await deleteShoppingListParticipantsById(
					req,
				);
				return sendDataResponse(res, result, 204);
			} catch (error) {
				return sendErrorResponse(res, error);
			}
		},
	);

	//#endregion

	////////////////
	// #region SHOPPING ITEMS
	app.get(`/${prefix}/:id/items`, async (req, res) => {
		try {
			const result = await getShoppingItemsByShoppingList(
				req,
			);
			return sendDataResponse(res, result, 200);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	app.post(`/${prefix}/:id/items`, async (req, res) => {
		try {
			const result = await addOrUpdateShoppingItem(
				req,
			);
			return sendDataResponse(res, result, 201);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	app.put(`/${prefix}/:id/items/:shoppingItemId`, async (req, res) => {
		try {
			const result = await addOrUpdateShoppingItem(
				req,
			);
			return sendDataResponse(res, result, 200);
		} catch (error) {
			return sendErrorResponse(res, error);
		}
	});

	app.patch(
		`/${prefix}/:id/items/:shoppingItemId/purchased`,
		async (req, res) => {
			try {
				const result = await togglePurchasedShoppingItem(
					req,
				);
				return sendDataResponse(res, result, 200);
			} catch (error) {
				return sendErrorResponse(res, error);
			}
		},
	);

	app.delete(
		`/${prefix}/:id/items/:shoppingItemId`,
		async (req, res) => {
			try {
				const result = await deleteShoppingItemById(
					req,
				);
				return sendDataResponse(res, result, 204);
			} catch (error) {
				return sendErrorResponse(res, error);
			}
		},
	);
	//#endregion
});

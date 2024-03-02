// @deno-types="npm:@types/express@4"
import express from 'npm:express@4.18.2';

import {
	addOrUpdateShoppingItem,
	togglePurchasedShoppingItem,
} from './add_or_update_shopping_item.ts';
import { deleteShoppingItemById } from './delete_shopping_item_by_id.ts';
import { getShoppingItemsByShoppingList } from './get_shopping_items_by_shopping_list.ts';

const app = express();
app.use(express.json());
const port = 3000;
const prefix = 'shopping_items';

app.get(
	`/${prefix}/all_by_shopping_list/:shopping_list_id`,
	async (req, res) => {
		//get_shopping_items_by_shopping_list
		const result = await getShoppingItemsByShoppingList();
		console.log(req.query);
		res.send(result);
	},
);

app.post(`/${prefix}/in_shopping_list/:shopping_list_id`, async (req, res) => {
	const result = await addOrUpdateShoppingItem(req);
	console.log(req.params);
	res.send(result);
});

app.put(`/${prefix}/:id`, async (req, res) => {
	const result = await addOrUpdateShoppingItem(req);
	console.log(req.params);
	res.send(result);
});

app.patch(`/${prefix}/:id/purchased`, async (req, res) => {
	const result = await togglePurchasedShoppingItem(req);
	console.log(req.params, result);
	res.send(result);
});

app.delete(`/${prefix}/:id`, async (req, res) => {
	const result = await deleteShoppingItemById();
	console.log(req.params);
	res.send(result);
});

app.listen(port, () => {
	console.log(`Example app listening on port ${port}`);
});

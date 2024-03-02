// @deno-types="npm:@types/express@4"
import express from 'npm:express@4.18.2';
import {
	addShoppingListById,
	updateShoppingListById,
} from './add_or_update_shopping_list.ts';
import { deleteShoppingListById } from './delete_shopping_list_by_id.ts';
import { getShoppingListById } from './get_shopping_list_by_id.ts';
import { getShoppingListsByUser } from './get_shopping_lists_by_user.ts';

const app = express();
app.use(express.json());
const port = 3000;
const prefix = 'shopping_lists';

app.get(`/${prefix}/all`, async (req, res) => {
	const result = await getShoppingListsByUser();
	console.log(req.query);
	res.send(result);
});

app.get(`/${prefix}/:id`, async (req, res) => {
	const result = await getShoppingListById();
	console.log(req.params);
	res.send(result);
});

app.post(`/${prefix}`, async (req, res) => {
	const result = await addShoppingListById(req);
	console.log('result -> ', result);
	res.send(result);
});

app.put(`/${prefix}/:id`, async (req, res) => {
	const result = await updateShoppingListById(req);
	console.log(req.params);
	res.send(result);
});

app.delete(`/${prefix}/:id`, async (req, res) => {
	const result = await deleteShoppingListById();
	console.log(req.params);
	res.send(result);
});

app.listen(port, () => {
	console.log(`Example app listening on port ${port}`);
});

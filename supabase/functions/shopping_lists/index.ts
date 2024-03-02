// @deno-types="npm:@types/express@4"
import express from 'npm:express@4.18.2';
import { addOrUpdateShoppingListById } from './add_or_update_shopping_list.ts';
import { deleteShoppingListById } from './delete_shopping_list_by_id.ts';
import { getShoppingListById } from './get_shopping_list_by_id.ts';
import { getShoppingListsByUser } from './get_shopping_lists_by_user.ts';

const app = express();
app.use(express.json());
const port = 3000;
const prefix = 'shopping_lists';

app.get(`/${prefix}/all`, (req, res) => {
	const result = getShoppingListsByUser();
	console.log(req.query);
	res.send(result);
});

app.get(`/${prefix}/:id`, (req, res) => {
	const result = getShoppingListById();
	console.log(req.params);
	res.send(result);
});

app.post(`/${prefix}`, (req, res) => {
	const result = addOrUpdateShoppingListById(req);
	console.log(req.params);
	res.send(result);
});

app.put(`/${prefix}/:id`, (req, res) => {
	const result = addOrUpdateShoppingListById(req);
	console.log(req.params);
	res.send(result);
});

app.delete(`/${prefix}/:id`, (req, res) => {
	const result = deleteShoppingListById();
	console.log(req.params);
	res.send(result);
});

app.listen(port, () => {
	console.log(`Example app listening on port ${port}`);
});

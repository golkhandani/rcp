import { generateFakeShoppingListData } from '../shared/models/shopping_list_model.ts';

export function getShoppingListsByUser() {
	const items = generateFakeShoppingListData(20);
	return items;
}

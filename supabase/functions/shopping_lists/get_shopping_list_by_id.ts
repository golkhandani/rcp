import { generateFakeShoppingListData } from '../shared/models/shopping_list_model.ts';

export function getShoppingListById() {
	const shoppingList = generateFakeShoppingListData(1);
	return shoppingList[0];
}

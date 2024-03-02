import { generateFakeShoppingItemData } from '../shared/models/shopping_item_model.ts';

export function getShoppingItemsByShoppingList() {
	const data = generateFakeShoppingItemData(20);
	return data;
}

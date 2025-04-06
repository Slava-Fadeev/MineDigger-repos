draw_self();
draw_set_font(global.FontInventory);

for(var i = 0; i < array_length(Items); i++){
	draw_sprite(SpShopItems, Items[i], x + (15 * i) + sprite_get_height(SpShopItems) / 2 + 2, y + YDelay - sprite_get_height(SpShopItems) / 2 - 1);
	draw_text(x + (15 * i) + 11 - (Stacks[i] == 2), y + YDelay - 1, Stacks[i]);
}
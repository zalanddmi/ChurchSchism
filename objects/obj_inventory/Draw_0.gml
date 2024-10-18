// Получаем координаты камеры
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

// Позиция инвентаря
var inventory_x = cam_x + display_get_width() / 2 - (global.slots * 64) / 2;
var inventory_y = cam_y + display_get_height() - 128;

// Отрисовка слотов и предметов
for (var i = 0; i < global.slots; i++) {
    var slot_x = inventory_x + i * 64;
    var slot_y = inventory_y;

    // Отрисовка слота
    draw_sprite(spr_inventory_item, 0, slot_x, slot_y);

    // Если в слоте есть предмет, отрисовываем его спрайт
    if (global.inventory[i] != noone) {
        var item = global.inventory[i]; // Получаем данные о предмете
        
        // Считаем координаты для центрирования предмета в ячейке
        var item_sprite_width = sprite_get_width(item.sprite);
        var item_sprite_height = sprite_get_height(item.sprite);
        
        var centered_x = slot_x + (64 / 2) - (item_sprite_width / 2); // 64 — размер слота
        var centered_y = slot_y + (64 / 2) - (item_sprite_height / 2);
        
        // Рисуем спрайт предмета в центре слота
        draw_sprite(item.sprite, 0, centered_x, centered_y);
    }
}

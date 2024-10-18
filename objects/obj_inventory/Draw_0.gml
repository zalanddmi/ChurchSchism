/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

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

    // Отрисовка предмета в слоте, если он есть
    if (global.inventory[i] != noone) {
        var item = global.inventory[i];
        draw_sprite(item.sprite_index, 0, slot_x, slot_y);
    }
}

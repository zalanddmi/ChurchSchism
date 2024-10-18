// Получаем координаты камеры
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

// Позиция инвентаря
var inventory_x = cam_x + display_get_width() / 2 - (global.slots * 64) / 2;
var inventory_y = cam_y + display_get_height() - 128;

var hovered_item = noone;  // Переменная для отслеживания предмета под курсором
var hovered_slot_x, hovered_slot_y;  // Координаты слота с предметом под курсором

// Сначала рисуем слоты и предметы
for (var i = 0; i < global.slots; i++) {
    var slot_x = inventory_x + i * 64;
    var slot_y = inventory_y;

    // Если слот выделен, рисуем рамку вокруг него
    if (i == global.selected_slot) {
        draw_set_color(c_yellow); // Цвет выделения (желтый)
        draw_rectangle(slot_x - 2, slot_y - 2, slot_x + 64 + 2, slot_y + 64 + 2, false); // Рамка
    }

    // Отрисовка слота
    draw_sprite(spr_inventory_item, 0, slot_x, slot_y);

    // Если в слоте есть предмет, отрисовываем его спрайт
    if (global.inventory[i] != noone) {
        var item = global.inventory[i]; // Получаем данные о предмете

        // Считаем координаты для центрирования предмета в ячейке
        var item_sprite_width = sprite_get_width(item.sprite);
        var item_sprite_height = sprite_get_height(item.sprite);
        var centered_x = slot_x + (64 / 2) - (item_sprite_width / 2);
        var centered_y = slot_y + (64 / 2) - (item_sprite_height / 2);

        // Рисуем спрайт предмета в центре слота
        draw_sprite(item.sprite, 0, centered_x, centered_y);

        // Проверка наведения на слот
        if (point_in_rectangle(mouse_x, mouse_y, slot_x, slot_y, slot_x + 64, slot_y + 64)) {
            hovered_item = item;  // Запоминаем предмет под курсором
            hovered_slot_x = slot_x;
            hovered_slot_y = slot_y;
        }
    }
}

// Теперь рисуем описание, только если есть предмет под курсором
if (hovered_item != noone) {
    var description_text = hovered_item.description; // Описание предмета

    // Получаем размеры текста
    var text_width = string_width(description_text);
    var text_height = string_height(description_text);

    // Рисуем черное окошко для текста над слотом (смещаем по Y вверх)
    var box_x = hovered_slot_x + 32 - text_width / 2;  // Центрируем окошко над слотом
    var box_y = hovered_slot_y - text_height - 10;     // Смещаем вверх над слотом

    draw_set_color(c_black);
    draw_rectangle(box_x - 2, box_y - 2, box_x + text_width + 2, box_y + text_height + 2, false);

    // Отрисовываем белый текст поверх черного фона
    draw_set_color(c_white);
    draw_text(box_x, box_y, description_text);
}

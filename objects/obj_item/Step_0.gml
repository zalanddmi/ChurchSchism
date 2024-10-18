// Проверяем, нажата ли левая кнопка мыши и мышь наведена на предмет
if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)) {
        // Ищем свободный слот
        for (var i = 0; i < global.slots; i++) {
            if (global.inventory[i] == noone) {
                // Создаем структуру данных для предмета
                var item_data = {
                    sprite: sprite_index,  // Сохраняем спрайт предмета
                    type: "first aid kit"  // Пример типа предмета, можно менять под разные предметы
                };
                
                // Сохраняем данные о предмете в инвентарь
                global.inventory[i] = item_data;
                
                // Удаляем предмет с экрана
                instance_destroy();
                break;
            }
        }
    }
}

// Проверяем, если выбранный слот содержит предмет
var selected_item = global.inventory[global.selected_slot];
if (selected_item != noone && keyboard_check_pressed(ord("X"))) {
    // Выбрасываем предмет из инвентаря
    var player_x = obj_player.x;  // Позиция игрока по X (или используйте позицию камеры, если нужно)
    var player_y = obj_player.y;  // Позиция игрока по Y

    // Создаем объект предмета в мире на позиции игрока
    var new_item = instance_create_layer(player_x, player_y - 32, "Instances", selected_item); // Смещаем вверх, чтобы предмет не спавнился прямо в игроке

    // Удаляем предмет из инвентаря
    global.inventory[global.selected_slot] = noone;
}



// Проверяем нажатие клавиш для выбора слота
if (keyboard_check_pressed(ord("1"))) {
    global.selected_slot = 0; // Первый слот
}
if (keyboard_check_pressed(ord("2"))) {
    global.selected_slot = 1; // Второй слот
}
if (keyboard_check_pressed(ord("3"))) {
    global.selected_slot = 2; // Третий слот
}
if (keyboard_check_pressed(ord("4"))) {
    global.selected_slot = 3; // Четвертый слот
}
if (keyboard_check_pressed(ord("5"))) {
    global.selected_slot = 4; // Пятый слот
}

// Отрисовка предмета
draw_self();  // Это вызовет стандартную отрисовку спрайта объекта

// Проверяем, если мышь наведена на предмет
if (point_in_rectangle(mouse_x, mouse_y, x, y, x + sprite_width, y + sprite_height)) {
    var description_text = "First aid kit"; // Пример описания

    // Получаем размеры текста
    var text_width = string_width(description_text);
    var text_height = string_height(description_text);

    // Рисуем черное окошко для текста над предметом (смещаем по Y вверх)
    var box_x = mouse_x - text_width / 2;
    var box_y = mouse_y - text_height - 16; // Смещаем на 16 пикселей выше курсора

    draw_set_color(c_black);
    draw_rectangle(box_x - 2, box_y - 2, box_x + text_width + 2, box_y + text_height + 2, false);

    // Отрисовываем белый текст описания поверх черного фона
    draw_set_color(c_white);
    draw_text(box_x, box_y, description_text);
}

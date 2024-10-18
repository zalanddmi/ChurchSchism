// Инициализация глобального инвентаря на 5 слотов
global.slots = 5;
global.inventory = array_create(global.slots);

// Переменная для хранения выбранного слота (по умолчанию 0 — первый слот)
global.selected_slot = 0;

// Инициализируем слоты как пустые (noone)
for (var i = 0; i < global.slots; i++) {
    global.inventory[i] = noone;
}

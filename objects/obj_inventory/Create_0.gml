/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
global.slots = 5;

global.inventory = array_create(global.slots);

for(var i = 0; i < global.slots; i++) {
	global.inventory[i] = noone;
}

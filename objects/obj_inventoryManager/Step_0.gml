selectedItem = -1;

for (var i = 0; i < array_length(inv); i++) {
	var _xx = screen_bord;
	var _yy = screen_bord + sep*i;
	
	if (mouse_x > _xx && mouse_y < _xx + 8 && mouse_y > _yy && mouse_y < _yy + 8) {
		selectedItem = i;
	}
}

if (selectedItem != -1) {
	if (mouse_check_button_pressed(mb_left) && !inv[selectedItem].canDrop && inv[selectedItem].count >= 1) {
		inv[selectedItem].effect();
	}
}
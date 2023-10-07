draw_set_font(global.fontMain);

for (var i = 0; i < array_length(inv); i++) {
	var _xx = screen_bord;
	var _yy = screen_bord;
	var _sep = sep;
	var _col = c_black;
	
	// draw icon
	draw_sprite(inv[i].sprite, 0, _xx, _yy + _sep * i);
	
	// selecting item
	if (selectedItem == i) {
		_col = c_red;
	}
	
	// set selected color
	draw_set_color(_col);
	
	// draw name
	draw_text(_xx + 16, _yy + _sep * i, inv[i].name);
	
	// draw description
	if (selectedItem == i) {
		draw_text_ext(_xx + 16, _yy + _sep * array_length(inv), inv[i].description, 12, 80);
	}
	// reset color
	draw_set_color(c_black);
}
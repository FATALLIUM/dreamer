sprite_index = item.sprite;

if (place_meeting(x, y, obj_player)) {
	if (itemPickUp(item)) {
		instance_destroy();
	}
}
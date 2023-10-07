depth = -9999;

listMax = 5;

function createItem(_name, _description, _sprite, _canDrop, _count, _effect) constructor {
	name = _name;
	description = _description;
	sprite = _sprite;
	canDrop = _canDrop;
	count = _count;
	effect = _effect;
}

global.itemList = {

	// test
	test : new createItem(
		"Test", 
		"A test item that does nothing.",
		forestCaveChair_spr,
		false,
		1,
		
		function() {
			// do something
			audio_play_sound(click, 1, 0);
			
			// use item
			if (count == 1) {
				array_delete(inv, selectedItem, 1);
			}
			else {
				count--;
			}
			// test half
			array_insert(inv, selectedItem, global.itemList.testHalf);
			}
		),
		
	testHalf : new createItem(
		"Test Half", 
		"Half of a test item.",
		forestCaveBed_spr,
		false,
		1,
		
		function() {
			audio_play_sound(click, 1, 0);
			array_delete(inv, selectedItem, 1);
		}
		),
		
	knife : new createItem(
		"Knife",
		"A sharp blade.",	
		knife_spr,
		false,
		1,
	
		function() {
			with (obj_player) {
				if (distance_to_object(obj_par_npc) < obj_player.distanceTrigger) {
					var inst = instance_nearest(x, y, obj_par_npc);
					if (inst.killable) {
						var npcSq = inst.name + "Chaos_sq";
						inst.dead = !inst.dead;
						
						var seq = layer_sequence_create("Assets_1", x, y, npcSq);
						layer_sequence_play(seq);
					}
				}
			}
		}	
	),
	
	
		
}

// create inventory
inv = array_create(0);

// borders
screen_bord = 16;
sep = 16;

// select item
selectedItem = -1;
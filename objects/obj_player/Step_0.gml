/// @description check current player stati (movement, health)

//
// !! movement !!
//

//show_debug_message(bool(plr_grounded));
plr_grounded = place_meeting(x,y+5, obj_env_barrier_floor); // true if player within 5px of floor
// show_debug_message(bool(plr_grounded));

if (plr_health > 0) { // if player is alive...
	if (keyboard_check_direct(vk_left) && !keyboard_check_direct(vk_right)) { // ... if holding left and not right...
		sprite_index = plr_spr_mv_gr_left; // ... use left sprite...
		plr_moveX = -1 * plr_speed; // ... and set leftwards direction
	};

	if (keyboard_check_direct(vk_right) && !keyboard_check_direct(vk_left)) { // ... if holding right and not left...
		sprite_index = plr_spr_mv_gr_right; // ... use right sprite...
		plr_moveX = plr_speed; // ... and set rightwards direction
	};

	if (plr_grounded) { // if player is on ground...
		if (keyboard_check_direct(vk_up) && !keyboard_check_direct(vk_down)) { // ... if holding up and not down...
			plr_moveY = -32 * plr_speed; // ... set upwards direction
		};
	
		if (keyboard_check_direct(vk_down) && !keyboard_check_direct(vk_up)) { // if holding down and not up...
			sprite_index = plr_spr_mv_gr_down; // use downwards sprite
		};
	};

	if (!plr_grounded){ // if player is not on ground...
		plr_moveY = 0; // ... kill vertical momentum
	};

	if (!keyboard_check_direct(vk_left) && !keyboard_check_direct(vk_right)){ // if not moving horizontally...
		plr_moveX = round(plr_moveX/4); // ... reduce horizontal momentum
		// causes a slide
	};

	// show_debug_message("X: " + string(plr_moveX) + ", Y: " + string(plr_moveY))

	if(!keyboard_check_direct(vk_up) && !keyboard_check_direct(vk_down) && !keyboard_check_direct(vk_left) && !keyboard_check_direct(vk_right)){ // if not holding movement keys...
		sprite_index = plr_spr_idle; // ... use idle sprite
	};
} else { // if player is dead...
	plr_moveX = 0;
	plr_moveY = 0;
	// ... kill all momentum
};

physics_apply_force(x,y,plr_moveX,plr_moveY); // apply movement as per above



//
// !! dmg & death !!
//

// show_debug_message(plr_dmg_counter);
// show_debug_message(plr_health);
if (plr_dmg_counter > 0) { // if damage counter active...
	image_blend = c_red; // ...turn sprite red
	plr_health--; // ... reduce player health
	plr_dmg_counter--; // ... reduce counter
} else { // if damage counter not active...
	image_blend = c_white; // ... return to normal sprite colours
};

if (plr_health < 1) { // if player is dead...
	image_blend = c_black; // ... turn sprite black
	plr_health = 0; // ... set health to 0 to prevent overflow
	plr_dmg_counter = 0; // ... end damage counter
	if (plr_death_timeout > 0) { // if respawn timer is above 0...
		plr_death_timeout--; // ... decrease respawn timer
	} else { // if respawn timer 0 or below...
		show_debug_message("player has died; restarting");
		room_restart(); // ... restart the room
	};
};


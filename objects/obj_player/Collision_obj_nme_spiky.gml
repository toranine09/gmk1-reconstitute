/// @description on collide, player hurts

show_debug_message("player touched spiky");
if (plr_health > 0 ) { // if the player has health...
	plr_dmg_counter = 5; // ... start  damage counter 
}
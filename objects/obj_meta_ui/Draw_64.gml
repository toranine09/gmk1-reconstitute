/// @description gui (health, vials)

draw_healthbar(health_xpos, health_ypos, health_xpos+health_width, health_ypos+health_height, obj_player.plr_health, health_bg_col, health_none_col, health_full_col, health_orientation, true, false);

if (global.plr_vials = 1) { // if the player has one vial...
	vials_plural = ""; // ... say "vial"
} else {
	vials_plural = "s"; // ... say "vials"
};
draw_text(vials_xpos, vials_ypos, string(global.plr_vials) + " vial" + string(vials_plural)); // draw vial count
/// @description endscreen


if (global.plr_vials = 1) { // if the player has one vial...
	vials_plural = ""; // ... say "vial"
} else {
	vials_plural = "s"; // ... say "vials"
};

draw_set_valign(fa_middle); // align text vertically centre
draw_set_halign(fa_center); // align text horizontally centre

// display end text in centre of viewport, at 2x scale
draw_text_transformed(view_xport[0]+view_wport[0]/2, view_yport[0]+view_hport[0]/2, "You collected " + string(global.plr_vials) + " vial" + string(vials_plural) + "!\nPlay again?",2,2,0);
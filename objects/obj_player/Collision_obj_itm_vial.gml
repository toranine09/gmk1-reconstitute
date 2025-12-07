/// @description on collect vial, gain point and destroy

show_debug_message("player collected vial");
global.plr_vials++; // increase vial count; global keeps the score across levels
instance_destroy(other); // destroy the touched vial instance
// show_debug_message("vials collected: " + string(plr_vials));
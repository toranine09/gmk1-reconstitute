/// @description enforce initial variables

show_debug_message("creating player");

// clear momentum
plr_moveX = 0;
plr_moveY = 0;

// lock rotation
phy_rotation = 0;
phy_fixed_rotation = true;

// reset other initial values
plr_speed = 10;
plr_grounded = false;
plr_health = 100;
plr_dmg_counter = 0;
plr_death_timeout = 60;

if (!variable_global_exists("plr_vials"))
{
    global.plr_vials = 0;
}
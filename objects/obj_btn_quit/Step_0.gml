/// @description quit button check


if	(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) { // if clicked on quit...
    game_end(); // ... close the game
};
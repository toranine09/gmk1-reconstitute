/// @description start button check


if	(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) { // if clicked on start...
    room_goto(1); // ... go to the first room
};
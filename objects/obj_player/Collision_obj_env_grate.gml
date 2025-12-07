/// @description on touch grate, end level

if (room_exists(room_next(room))) { // if there is another room...
	show_debug_message("player touched level end");
    room_goto_next(); // ... go to the next room
} else {
	show_debug_message("player touched level end, but no room exists");
};
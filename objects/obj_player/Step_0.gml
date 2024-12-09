var _right_key = keyboard_check(ord("D"));
var _left_key = keyboard_check(ord("A"));
var _up_key = keyboard_check(ord("W"));
var _down_key = keyboard_check(ord("S"));


xspd = (_right_key - _left_key) * move_speed;
yspd = (_down_key - _up_key) * move_speed;


// set sprite
mask_index = sprite[DOWN];
// make left/right-movement trump down and up (similar to stardew valley)
// Check for right/left movement
if (xspd > 0) {
    face = RIGHT;
} else if (xspd < 0) {
    face = LEFT;
}

// Check for up/down movement only if face is not already set
if (xspd == 0) {
    if (yspd > 0) {
        face = DOWN;
    } else if (yspd < 0) {
        face = UP;
    }
}
sprite_index = sprite[face];


// collision handling
if place_meeting(x+xspd, y, obj_wall) {
	xspd = 0;
}
if place_meeting(x, y+yspd, obj_wall) {
	yspd = 0;
}


// move the player 
x += xspd;
y += yspd;


// animate
if xspd == 0 && yspd == 0 {image_index = 0;}
// 2 wheel robot for Raspberry Pi (model B).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

use <empty_board.scad>
include <parts.scad>
include <global_vars.scad>

/////////////////////////////////////////////

module batteries_and_motors_board() {

    offset_x = battery_holder_3xAA_selectronic_depth/2 + 2;
    offset_y = (board_depth - micro_gearmotor_pololu_width)/2;
    
    difference() {
        empty_board();

        // Battery holders
        translate([4, 0, (battery_holder_3xAA_selectronic_height+board_height)/2]) {
            translate([-offset_x, 0, -1]) rotate(a=[0,0,90]) #battery_holder_3xAA_selectronic();
            translate([ offset_x, 0, -1]) rotate(a=[0,0,90]) #battery_holder_3xAA_selectronic();
        }

        // DC motors
        translate([-56, 0, (micro_gearmotor_pololu_height+board_height)/2]) {
            translate([0, -offset_y-0.1, -1]) rotate(a=[0,0,-90]) #micro_metal_dc_gearmotor_pololu();
            translate([0,  offset_y+0.1, -1]) rotate(a=[0,0, 90]) #micro_metal_dc_gearmotor_pololu();
        }

        // Ball caster
        translate([65, 0, -(ball_caster_34_pololu_height + board_height)/2]) #ball_caster_34_pololu();
    }
}

translate([0, 0, board_height/2]) {
    batteries_and_motors_board();
}

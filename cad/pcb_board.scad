// 2 wheel robot for Raspberry Pi (model B).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

use <empty_board.scad>
include <parts.scad>
include <global_vars.scad>

/////////////////////////////////////////////

slot_width = 10;
slot_depth = mini_bread_board_sfe_width;
slot_height = board_height + 1;

module pcb_board() {
    offset_x1 = mini_bread_board_sfe_depth/2 + 12.5;
    offset_x2 = mini_bread_board_sfe_depth + 12.5 + slot_width/2 + 10;

    difference() {
        empty_board();

        // Breadboard
        translate([0, 0, (mini_bread_board_sfe_height+board_height)/2]) {
            translate([-offset_x1, 0, -1]) rotate(a=[0,0,90]) #mini_bread_board_sfe();
            translate([ offset_x1, 0, -1]) rotate(a=[0,0,90]) #mini_bread_board_sfe();
        }

        // Cables slots
        translate([-offset_x2, 0, 0]) #cube([slot_width, slot_depth, slot_height], center=true);
        translate([ 0, 0, 0])         #cube([slot_width, slot_depth, slot_height], center=true);
        translate([ offset_x2, 0, 0]) #cube([slot_width, slot_depth, slot_height], center=true);
    }
}

translate([0, 0, board_height/2]) {
    pcb_board();
}

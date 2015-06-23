// 2 wheel robot for Raspberry Pi (model B).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

use <empty_board.scad>
include <parts.scad>
include <global_vars.scad>

/////////////////////////////////////////////


pipe_radius_in = 2.5;
pipe_radius_out = 4;
pipe_radius_out2 = 5;
pipe_height = 20;

module pipes_board() {

    board_width = pipe_radius_out + 20;
    board_depth = pipe_radius_out + 20;

    difference() {
        cube([board_width, board_depth, board_height], center=true);
        cylinder(r=pipe_radius_out2, h=board_height+1, center=true, $fn=50);
    }

    translate([0, 0, (pipe_height-board_height)/2]) {
        pipe();
    }
}

module pipe() {
    difference() {
        union() {
            cylinder(r=pipe_radius_out, h=pipe_height,   center=true, $fn=50);
            translate([0, 0, -(pipe_height-board_height)/2]) {
                rotate(a=[0,0,0])  cube([pipe_radius_out2*2+1, 2, board_height], center=true);
                rotate(a=[0,0,90]) cube([pipe_radius_out2*2+1, 2, board_height], center=true);
            }
        }
        #cylinder(r=pipe_radius_in, h=pipe_height+1, center=true, $fn=50);
    }

}

translate([0, 0, board_height/2]) {
    pipes_board();
}

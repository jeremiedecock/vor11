// 2 wheel robot for Raspberry Pi (model B).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

use <../LIB/four_screw_holes.scad>
use <../LIB/rounded_corner_board.scad>
include <global_vars.scad>

/////////////////////////////////////////////

module empty_board() {
    difference() {
        4_rounded_corners_board(board_width=board_width, board_depth=board_depth, board_height=board_height, board_corner_radius=board_corner_radius);
        #four_screw_holes(screw_holes_radius, screw_holes_spacing_x, screw_holes_spacing_y, board_height+1);
    }
}


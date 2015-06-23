// 2 wheel robot for Raspberry Pi (model B).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

use <../LIB/pibow_base/pibow_model_b_coupe_base.scad>

use <empty_board.scad>
include <parts.scad>
include <global_vars.scad>

/////////////////////////////////////////////

sd_slot_width = 10;
sd_slot_depth = 25;

module rpi_board() {
    gpio_slot_width = 33;
    gpio_slot_depth = (board_depth - pibow_b_depth)/4;

    gpio_slot_width_border = 5;

    hinge_height_1 = 11;
    hinge_depth_1 = 13;
    hinge_radius_in = 2;
    hinge_radius_out = 5.5;

    offset_x1 = (board_width - pibow_b_width)/2 - sd_slot_width;
    offset_z1 = (pibow_b_height + board_height)/2 - 1;

    offset_x2 = (board_width - sd_slot_width)/2;
    offset_y2 = (board_depth - sd_slot_depth)/2 - (board_depth - pibow_b_depth)/2 - 17;

    offset_x3 = (board_width - gpio_slot_width)/2 - sd_slot_width - 5;
    offset_y3 = (board_depth - gpio_slot_depth)/2;

    offset_x4 = (board_width - hinge_radius_out*2)/2;

    offset_z4 = (board_height + hinge_height_1)/2;
    offset_z5 = board_height/2 + hinge_height_1;

    difference() {
        empty_board();

        // Pibow for Raspberry Pi
        translate([-offset_x1, 0, offset_z1]) {
            #pibow_model_b();
        }

        // RPi screw holes
        translate([-offset_x1, 0, 0]) {
            #pibow_b_base(board_height+1);
        }

        // SD card slot
        translate([-offset_x2 - 0.01, offset_y2, 0]) {
            #cube([sd_slot_width, sd_slot_depth, board_height+1], center=true);
        }

        // GPIO cable slot
        translate([-offset_x3, offset_y3 + 0.01, 0]) {
            translate([0, -gpio_slot_depth, 0]) #cube([gpio_slot_width, gpio_slot_depth, board_height+1], center=true);
            translate([0, 0, 0])                #cube([gpio_slot_width-(2*gpio_slot_width_border), gpio_slot_depth+1, board_height+1], center=true);
        }
    }

    // Raspicam hinge
    translate([offset_x4, 0, 0]) {
        difference() {
            union() {
                translate([0, 0, offset_z4]) cube([hinge_radius_out*2, hinge_depth_1, hinge_height_1], center=true);
                translate([0, 0, offset_z5]) rotate(a=[90,0,0]) cylinder(r=hinge_radius_out, h=hinge_depth_1, center=true, $fn=50);
            }
            translate([0, 0, offset_z5]) rotate(a=[90,0,0]) #cylinder(r=hinge_radius_in, h=hinge_depth_1+1, center=true, $fn=50);
        }
    }
}

translate([0, 0, board_height/2]) {
    rpi_board();
}

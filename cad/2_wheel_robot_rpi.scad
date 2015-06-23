// 2 wheel robot for Raspberry Pi (model B).

// Copyright (c) 2014 Jérémie DECOCK <jd.jdhp@gmail.com>

use <batteries_and_motors_board.scad>
use <pcb_board.scad>
use <rpi_board.scad>
include <parts.scad>
include <global_vars.scad>

/////////////////////////////////////////////

module_height = 20 + board_height;

translate([0, 0, module_height/2]) {
    translate([0, 0, 0]) {
        batteries_and_motors_board();

//        // Battery holders
//        translate([15, 0, (battery_holder_3xAA_selectronic_height+board_height)/2]) {
//            translate([-27, 0, 0]) rotate(a=[0,0,90]) #battery_holder_3xAA_selectronic();
//            translate([ 27, 0, 0]) rotate(a=[0,0,90]) #battery_holder_3xAA_selectronic();
//        }

//        // DC motors
//        translate([-60, 0, (micro_gearmotor_pololu_height+board_height)/2]) {
//            translate([0, -27, 0]) rotate(a=[0,0,90]) #micro_metal_dc_gearmotor_pololu();
//            translate([0,  27, 0]) rotate(a=[0,0,90]) #micro_metal_dc_gearmotor_pololu();
//        }
        
        // Wheels
        translate([-60, 0, (micro_gearmotor_pololu_height+board_height)/2]) {
            translate([0, -50, 0]) rotate(a=[90,0,0]) #wheel_pololu();
            translate([0,  50, 0]) rotate(a=[90,0,0]) #wheel_pololu();
        }

//        // Ball caster
//        translate([60, 0, -ball_caster_34_pololu_radius - board_height/2]) #ball_caster_34_pololu();
    }

    translate([0, 0, module_height]) {
        pcb_board();

//        // Breadboard
//        translate([0, 0, (mini_bread_board_sfe_height+board_height)/2]) {
//            translate([-25, 0, 0]) rotate(a=[0,0,90]) #mini_bread_board_sfe();
//            translate([ 25, 0, 0]) rotate(a=[0,0,90]) #mini_bread_board_sfe();
//        }
    }

    translate([0, 0, 2*module_height]) {
        rpi_board();

//        // Pibow for Raspberry Pi
//        translate([-20, 0, (pibow_b_height+board_height)/2]) #pibow_model_b();
    }
}



// Mini bread board sfe ///////////////////////////////////////////////////////
//  SFE ref: PRT-12044 Breadboard - Mini Modular (Red)
//  Dimensions (mm): 47 x 35 x 10

mini_bread_board_sfe_width = 47;
mini_bread_board_sfe_depth = 35;
mini_bread_board_sfe_height = 10;

module mini_bread_board_sfe(enlarge=2) {
    cube([mini_bread_board_sfe_width+enlarge, mini_bread_board_sfe_depth+enlarge, mini_bread_board_sfe_height], center=true);
}


// Micro metal DC gearmotor Pololu ////////////////////////////////////////////
//  Micro metal DC gearmotors (95:1):
//  Pimoroni ref: COM-MOT-95:1
//  Motor Size: 26 x 12 x 10mm
//  Shaft Size: 3mm Diameter x 10mm Length
// Bracket: http://www.pololu.com/product/989

micro_gearmotor_pololu_width = 26;
micro_gearmotor_pololu_depth = 12;
micro_gearmotor_pololu_height = 10;

module micro_metal_dc_gearmotor_pololu(screw_height = 4) {
    width1 = 8.5;
    width2 = 11.5;
    depth1 = 18.0;
    depth2 = 15.0;
    height1 = 3;
    height2 = 11.5;
    offset_x1 = (micro_gearmotor_pololu_width - width1)/2;
    offset_x2 = (micro_gearmotor_pololu_width - width2)/2;
    offset_y1 = depth1/2;
    offset_z1 = (micro_gearmotor_pololu_height - height1)/2;
    offset_z2 = (micro_gearmotor_pololu_height - height2)/2;
    offset_z3 = (screw_height+height1)/2;

    screw_radius = 2.184/2; // "2-56" screw

    // Motor
    cube([micro_gearmotor_pololu_width, micro_gearmotor_pololu_depth, micro_gearmotor_pololu_height], center=true);

    // Bracket (Pololu item #989)
    translate([offset_x1,  0, -offset_z1]) cube([width1, depth1, height1], center=true);

    translate([offset_x2,  0, -offset_z2]) cube([width2, depth2, height2], center=true);

    translate([offset_x1,  offset_y1, -offset_z1]) {
        cylinder(r=width1/2, h=height1, center=true, $fn=30);

        // Bracket screw
        translate([0, 0, -offset_z3 + 0.5]) cylinder(r=screw_radius+0.1, h=screw_height, center=true, $fn=30);
    }

    translate([offset_x1, -offset_y1, -offset_z1]) {
        cylinder(r=width1/2, h=height1, center=true, $fn=30);

        // Bracket screw
        translate([0, 0, -offset_z3 + 0.5]) cylinder(r=screw_radius+0.1, h=screw_height, center=true, $fn=30);
    }
}


// Wheel 6mm pololu ///////////////////////////////////////////////////////////
//  Pololu 6mm Wheels: 
//  Pimoroni ref: #1420
//  Width: 8mm
//  Diameter: 60mm

wheel_6_pololu_radius = 30;
wheel_6_pololu_depth = 8;

module wheel_pololu() {
    cylinder(r=wheel_6_pololu_radius, h=wheel_6_pololu_depth, center=true, $fn=50);
}


// Battery holder 3xAA Selectronic ////////////////////////////////////////////
//  Battery Holder:
//  3xAA Selectronic.fr ref: 15.9215
//  Dimensions (mm): 58 x 48 x 17

battery_holder_3xAA_selectronic_width = 58;
battery_holder_3xAA_selectronic_depth = 48;
battery_holder_3xAA_selectronic_height = 17;
battery_holder_3xAA_selectronic_screw_radius = 1.5;

module battery_holder_3xAA_selectronic(screw_height=4) {
    cube([battery_holder_3xAA_selectronic_width, battery_holder_3xAA_selectronic_depth, battery_holder_3xAA_selectronic_height], center=true);

    // Screw holes
    offset_y = battery_holder_3xAA_selectronic_depth/2 - 8.5;
    offset_z = 1-(battery_holder_3xAA_selectronic_height+screw_height)/2;
    translate([0,  offset_y, offset_z]) cylinder(r=battery_holder_3xAA_selectronic_screw_radius, h=screw_height, center=true, $fn=30);
    translate([0, -offset_y, offset_z]) cylinder(r=battery_holder_3xAA_selectronic_screw_radius, h=screw_height, center=true, $fn=30);
}


// Pibow (model b) ////////////////////////////////////////////////////////////
//  Pibow (model b): 
//  Dimensions (mm): 98 x 65.5 x 18

pibow_b_width = 98;
pibow_b_depth = 65.5;
pibow_b_height = 18;

module pibow_model_b() {
    cube([pibow_b_width, pibow_b_depth, pibow_b_height], center=true);
}


// Ball Caster Metal 3/8" Pololu //////////////////////////////////////////////
//  Ball Caster:
//  SFE ref: ROB-08909 Ball Caster Metal - 3/8" (diameter = 9.525mm)

ball_caster_38_pololu_radius = 9.525/2;
ball_caster_38_pololu_height = 10.16;

module ball_caster_38_pololu() {
    cylinder_height = 7.5;
    cylinder_radius = ball_caster_38_pololu_radius + 1;

    offset_z1 = (ball_caster_38_pololu_height-cylinder_height)/2;
    offset_z2 = -ball_caster_38_pololu_height/2 + ball_caster_38_pololu_radius;

    translate([0, 0, offset_z1]) cylinder(r=cylinder_radius, h=cylinder_height, center=true, $fn=50);
    translate([0, 0, offset_z2]) sphere(r=ball_caster_38_pololu_radius, $fn=50);

    // Debug
    //translate([ball_caster_38_pololu_radius, 0, 0]) #cube([cylinder_radius*2, cylinder_radius*2, ball_caster_38_pololu_height], center=true);
}


// Ball Caster Metal 3/4" Pololu //////////////////////////////////////////////
// http://www.pololu.com/product/955
// ball caster diameter: 19.05mm;
// screw diameter: 2.413mm
// screw spacing: 15.494mm

ball_caster_34_pololu_radius = 19.05/2;
ball_caster_34_pololu_height = 20.95;

module ball_caster_34_pololu(screw_height = 5) {
    cylinder_height = 15;
    cylinder_radius = ball_caster_34_pololu_radius + 1.5;
    screw_radius = 2.5/2;
    screw_spacing = 15.494;

    offset_z1 = (ball_caster_34_pololu_height-cylinder_height)/2;
    offset_z2 = -ball_caster_34_pololu_height/2 + ball_caster_34_pololu_radius;
    offset_z3 = (ball_caster_34_pololu_height+screw_height)/2;

    translate([0, 0, offset_z1]) cylinder(r=cylinder_radius, h=cylinder_height, center=true, $fn=50);
    translate([0, 0, offset_z2]) sphere(r=ball_caster_34_pololu_radius, $fn=50);

    translate([0,  screw_spacing/2, offset_z3 - 1]) cylinder(r=screw_radius, h=screw_height, center=true, $fn=50);
    translate([0, -screw_spacing/2, offset_z3 - 1]) cylinder(r=screw_radius, h=screw_height, center=true, $fn=50);

    // Debug
    //translate([cylinder_radius, 0, 0]) #cube([cylinder_radius*2, cylinder_radius*2, ball_caster_34_pololu_height], center=true);
}


// TEST ///////////////////////////////////////////////////////////////////////

//micro_metal_dc_gearmotor_pololu();
//battery_holder_3xAA_selectronic(screw_height=4);
//ball_caster_38_pololu();
//ball_caster_34_pololu();


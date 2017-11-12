include <variables.scad>;


//tripod_mount_file = "Easy 35 B2 Body.stl";

module SlideInRails(print_tolerance) {
    rail_width = 2;
    rail_height = 2;
    rail_distance_from_edge = - rail_height - 3;
    
    color("red")
    translate([0,
               0,
               rail_distance_from_edge - print_tolerance / 2]) {
        translate([0, -rail_width - print_tolerance, 0])
            cube(size=[lens_mount_width + print_tolerance,
                       rail_width + print_tolerance,
                       rail_height + print_tolerance]);
        translate([0, lens_mount_width + print_tolerance, 0])
            cube(size=[lens_mount_width + print_tolerance,
                       rail_width + print_tolerance,
                       rail_height + print_tolerance]);
    }
}

module BackWall() {
    color("black")
    translate([0,
               0,
               0])
        cube(size=[back_wall_width,
                   outer_box_size[1],
                   outer_box_size[2]]);
};

module LightCoverX(print_tolerance) {
    color("blue")
    translate([lens_mount_width + print_tolerance,
               0,
               - 2 - print_tolerance])
        cube(size=[2 + print_tolerance,
                   lens_mount_width + print_tolerance,
                   2 + print_tolerance]);
};


module CameraFrontWithoutLensMount(print_tolerance) {    
    difference() {
        union() {
            BackWall();
            
            translate(inner_box_offset - [0, print_tolerance / 2, 0]) {
                translate([0, 0, - inner_box_size[2]])
                    cube(size=inner_box_size
                              + [print_tolerance,
                                 print_tolerance,
                                 // No print tolerance on Z axis, because
                                 // one has already been applied on rails.
                                 // Doubling it on Z axis is dangerous
                                 // as could affect flange distance.
                                 0]);
                SlideInRails(print_tolerance);
                LightCoverX(print_tolerance);
            };
        }
    }
}

rear_lens_cap_file = "E-mount_rear_lenscap.STL";

module CameraFront() {
    difference() {
        union() {
            CameraFrontWithoutLensMount(0);
            
            // Height is ~ 9,00 mm.
            translate(inner_box_offset)
                 import(rear_lens_cap_file);
        }
        
        translate(inner_box_offset
                   + [lens_mount_width / 2,
                      lens_mount_width / 2,
                      0]) {
            cylinder(r1 = 21.5, r2 = 21.5, h = 4);
            translate([0, 0, -10]) 
                cylinder(r1 = 30, r2 = 22, h = 10);
        }
    }
}

module CameraBack() {
    difference() {        
        cube(size=outer_box_size);
        CameraFrontWithoutLensMount(print_tolerance);
    };
}

module CenteredOnBack(size) {
    translate(inner_box_offset + [(lens_mount_width - size) / 2,
                                  (lens_mount_width - size) / 2,
                                  -inner_box_size[2] - 2]) {
        children();
    }
}


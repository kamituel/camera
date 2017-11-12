include <shared.scad>;

difference() {
    CameraBack();
    
    CenteredOnBack(photo_plate_width) {
        color("purple")
        cube(size=[photo_plate_width,
                   photo_plate_width,
                   photo_plate_height]);
            
        // Placeholder for a finger (useful for removing a photo plate).
        translate([2,
                   photo_plate_width / 2,
                   0])
            cylinder(r1=5, r2=5, h=photo_plate_height);
                         
        /*color("pink")
        translate([photo_slot_width / 2 - 2,
                   photo_slot_width / 2 - 2,
                   -0.2])
            cube(size=[2, 2, 0.2]);*/
    }
 }
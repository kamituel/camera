include <shared.scad>;

difference() {
    CameraBack();
    
    focusing_screen_width = photo_plate_width + 4;
    CenteredOnBack(focusing_screen_width) {
        cube(size=[focusing_screen_width,
                   focusing_screen_width,
                   photo_plate_height]);
    }
    
    CenteredOnBack(photo_plate_width) {
        translate([0, 0, -10])
            cube(size=[photo_plate_width,
                       photo_plate_width,
                       10]);
    }
}
include <shared.scad>;


CameraFront(0);

translate([30,0,0])
    CameraBack();

    
// Sanity check - if camera front and back have
// overlap, they won't fit together.
/*intersection() {
    CameraFront();
    CameraBack();
};*/
 
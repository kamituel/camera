// ajmaker.pl oferuje dokładność 0.6 mm.
print_tolerance = 0.6; // mm

// 2 mm   - płyta kompozytowa
// 1.6 mm - szyba (http://szlachetnafotografia.com/kategoria/ambrotyp-kolodion/szybki-do-kolodionu-13x18cm)
photo_plate_height = 2 + print_tolerance;
photo_plate_width = 50;

// E-Mount flange distance. Distance between rear part
// of the lens mount on the lens (or front part of the lens 
// mount on the body) and the front of the photo plate.
e_mount_flange_distance = 18;

// Height of the circle lens mount.
lens_mount_height = 9; // mm

// Diameter of the circle lens mount.
lens_mount_width = 61;

// Width (along x axis) of the back (side) wall.
back_wall_width = 2;

outer_box_size = [70, 70, 13];

inner_box_size = [lens_mount_width,
                  lens_mount_width,
                  e_mount_flange_distance - lens_mount_height];

// Offset in relation to the outer box.
inner_box_offset = [back_wall_width,
                    (outer_box_size[1] - lens_mount_width) / 2,
                    outer_box_size[2]];
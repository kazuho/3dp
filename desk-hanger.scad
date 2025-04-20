W = 30;
D = 20;
R = 5;
L = 30;
thick = 2;
deskH = 19;

difference () {
    union () {
        // body
        hull () {
            for (x = [-W / 2 + thick, W / 2 - thick])
                for (y = [thick, D - thick / 2])
                    for (z = [thick, thick + deskH])
                        translate([x, y, z])
                            sphere(r = thick, $fn = 16);
        }
        // hook
        translate([0, D - thick / 2, -L])
            cylinder(r = thick, h = L + thick, $fn = 16);
        translate([0, D - thick / 2 - R, -L]) {
            rotate([-90, 0, 90]) {
                rotate_extrude(angle = 135)
                    translate([R, 0])
                        circle(r = thick, $fn = 16);
                rotate([0, 0, 135]) {
                    translate([R, 0, 0])
                        rotate([-90, 0, 0]) 
                            cylinder(r = thick, h = L / 2, $fn = 16);
                    translate([R, L / 2, 0])
                        sphere(r = thick, $fn = 16);
                }
            }
        }
    }
    // table cutout
    translate([-W / 2, 0, 0])
        rotate([0, 90, 0])
            linear_extrude(W)
                polygon([[-thick, 0], [-thick - deskH + 1, 0], [-thick - deskH, 1],
                         [-thick - deskH, D - thick], [-thick, D - thick]]);
    // flatten rear
    translate([-W / 2, D, -100])
        cube([W, 100, 200]);
}

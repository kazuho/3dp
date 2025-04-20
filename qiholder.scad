magsafeR = 56 / 2;
thick = 5.6;
magsafeY = 43 + magsafeR;
W = 71;
D = magsafeY + magsafeR + 2;

difference() {
    hull() {
        for (x = [1, W - 1])
            for (y = [1, D - 1])
                for (z = [1, thick - 1])
                    translate([x, y, z])
                        sphere(r = 1, $fn = 16);
    }
    translate([W / 2, magsafeY, 0]) {
        cylinder(r1 = magsafeR - 0.4, r2 = magsafeR, h = 0.4, $fn = 128);
        translate([0, 0, 0.4])
            cylinder(r = magsafeR, h = thick - 0.4 * 2, $fn = 128);
        translate([0, 0, thick - 0.4])
            cylinder(r1 = magsafeR, r2 = magsafeR - 0.4, h = 0.4, $fn = 128);
    }
    translate([W / 2 - 4, magsafeY - magsafeR - 20, 0])
        cube([8, D, thick]);
}

translate([0, 1, thick - 1]) {
    rotate([60, 0, 0]) {
        translate([0, -1, -thick + 1]) {
            difference() {
                hull() {
                    for (x = [1, W - 1])
                        for (y = [1, magsafeY * 1.2 - 1])
                            for (z = [1, thick - 1])
                                translate([x, y, z])
                                    sphere(r = 1, $fn = 16);
                }
                hull() {
                    translate([5, 15, -thick * 2 + 2])
                        rotate([0, 90, 0])
                            cylinder(r = thick * 2, h = W - 10, $fn = 32);
                    translate([5, magsafeY * 1.2 - 10, -thick * 2 + 2])
                        rotate([0, 90, 0])
                            cylinder(r = thick * 2, h = W - 10, $fn = 32);
                }
            }
        }
    }
}

W = 200;
D = 70;
H = 95;
R = 4;
thick = 1.2;
mountH = 2;

difference() {
    union() {
        hull() {
            for (x = [R, W - R]) {
                for (y = [R, D - R]) {
                    translate([x, y, R + 2])
                        sphere(r = R, $fn = 32);
                    translate([x, y, H - 1])
                        cylinder(r = R, h = 1, $fn = 32);
                }
            }
        }
        hull() {
            for (x = [R, W - R])
                for (y = [R, D - R])
                    translate([x, y, 0])
                        cylinder(r = R - 2, h = H, $fn = 32);
        }
    }
    hull() {
        for (x = [R, W - R]) {
            for (y = [R, D - R]) {
                translate([x, y, R + 2 + thick])
                    sphere(r = R - thick, $fn = 32);
                translate([x, y, H - 1])
                    cylinder(r = R - thick, h = 1, $fn = 32);
            }
        }
    }
    hull() {
        for (x = [R, W - R])
            for (y = [R, D - R])
                translate([x, y, thick])
                    cylinder(r = R - 2 - thick, h = H, $fn = 32);
    }
    rotate([-90, 0, 0]) {
        hull() {
            for (x = [R * 3, W - R * 3])
                translate([x, -(R * 2 + 2), 0])
                    cylinder(r = R, h = thick + 1, $fn = 32);
            translate([R * 2, -H, 0])
                cube([W - R * 4, 1, thick + 1]);
        }
    }
    rotate([0, 90, 0]) {
        for (y = [1:3])
            for (x = [1:5])
                translate([-H / 6 * x, D / 4 * y, 0])
                    cylinder(r = R * 1.5, h = W, $fn = 32);
    }
    rotate([-90, 0, 0]) {
        for (x = [1:10])
            for (y = [1:5])
                translate([W / 11 * x, -H / 6 * y, 0])
                    cylinder(r = R * 1.5, h = W, $fn = 32);
    }
    translate([R * 3, D - thick, H - 2])
        cube([W - R * 6, thick, 2]);
}

intersection() {
    union() {
        for (x = [0, W])
            for (y = [0, D])
                translate([x, y, H - 2 - R * 2])
                    cylinder(r1 = 0, r2 = R * 2, h = R * 2, $fn = 32);
    }
    hull() {
        for (x = [R, W - R])
            for (y = [R, D - R])
                translate([x, y, 0])
                    cylinder(r = R, h = H, $fn = 32);
    }
}

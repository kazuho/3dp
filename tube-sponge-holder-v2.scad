thick = 1.6;
W = 70;
D = 60;
H = 120;
R = 20;
suckerRin = 4.5;
suckerRout = 9;

difference() {
    base(0);
    base(thick);
    translate([0, 0, -thick * 2])
        cube([W, D, thick * 2]);
    hull() {
        translate([W / 2, D / 2, R + (W - R * 2) / 2])
            rotate([-90, 0, 0])
                cylinder(r = (W - R * 2) / 2, h = D / 2, $fn = 32);
        translate([R, D / 2, H - 1])
            cube([W - R * 2, D / 2, 1]);
    }
    difference() {
        translate([thick, D / 2, H - (R - thick)])
            cube([R - thick, D / 2, R - thick]);
        translate([thick, 0, H - (R - thick)])
            rotate([-90, 0, 0])
                cylinder(r = R - thick, h = D, $fn = 32);
    }
    difference() {
        translate([W - R, D / 2, H - (R - thick)])
            cube([R - thick, D / 2, R - thick]);
        translate([W - thick, 0, H - (R - thick)])
            rotate([-90, 0, 0])
                cylinder(r = R - thick, h = D, $fn = 32);
    }

    translate([W / 2, 0, H - suckerRout * 1.5])
        rotate([-90, 0, 0])
            cylinder(r = suckerRin, h = D / 2, $fn = 32);
    translate([W / 2 - (suckerRin - 1), 0, H - suckerRout * 3])
        cube([(suckerRin -1) * 2, D / 2, suckerRout * 1.5]);
    translate([W / 2, 0, H - suckerRout * 3])
        rotate([-90, 0, 0])
            cylinder(r = suckerRout, h = D / 2, $fn = 32);
}

module base(delta) {
    hull() {
        for (x = [R, W - R]) {
            for (y = [R, D - R]) {
                translate([x, y, R - thick * 2])
                    sphere(r = R - delta, $fn = 32);
                translate([x, y, H - 1])
                    cylinder(r = R - delta, h = 1, $fn = 32);
            }
        }
    }
}

W = 110;
D = 80;
H = 100;
R = 5;
thick = 2;

difference () {
    hull () {
        for (x = [R, W - R]) {
            for (y = [R, D - R]) {
                translate([x, y, R])
                    sphere(r = R, $fn = 16);
                translate([x, y, H - R])
                    cylinder(r = R, h = R, $fn = 16);
            }
        }
    }
    translate([R, R, thick])
        cube([W - R * 2, D - R * 2, H - thick]);
    translate([R, thick, R])
        cube([W - R * 2, D - thick * 2, H - R]);
    translate([thick, R, R])
        cube([W - thick * 2, D - R * 2, H - R]);
    intersection() {
        translate([R, R, 0])
            cube([W - R * 2, D - R * 2, thick]);
        mesh(W, H, thick);
    }
    intersection () {
        translate([R, 0, R])
            cube([W - R * 2, D, H - R * 2]);
        translate([0, 0, H - R])
            rotate([-90, 0, 0])
                mesh(W, H, D);
    }
    intersection () {
        translate([0, R, R])
            cube([W, D - R * 2, H - R * 2]);
        translate([W, 0, H - R])
            rotate([-90, 0, 90])
                mesh(D, H, W);
    }
}

module mesh(w, h, d) {
    for (y = [0:ceil(w / 20)]) {
        for (x = [0:ceil(h / 20)]) {
            translate([x * 20, y * 20 + 6 * sqrt(2), 0])
                rotate([0, 0, 45])
                    translate([-6, -6, 0])
                        cube([12, 12, d]);
            translate([x * 20 + 10, y * 20 + 6 * sqrt(2) + 10, 0])
                rotate([0, 0, 45])
                    translate([-6, -6, 0])
                        cube([12, 12, d]);
        }
    }
}
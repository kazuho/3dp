R = 34.4 / 2;
R0 = 30.6 / 2;
R1 = 31.4 / 2;
H = 45;
H1 = 2; // もうちょいきつくてもいいかも
H2 = R1 - R0;
H3 = 5;
thick = 2.5;
fn = 128;

difference() {
    union() {
        translate([0, 0, -H + R - 1])
            sphere(r = R, $fn = fn);
        translate([0, 0, -H + R - 1])
            cylinder(r = R, h = H - (R - 1), $fn = fn);
        cylinder(r = R0, h = H1, $fn = fn);
        translate([0, 0, H1])
            cylinder(r1 = R0, r2 = R1, h = H2, $fn = fn);
        translate([0, 0, H1 + H2])
            cylinder(r = R1, h = H3, $fn = fn);
        translate([0, 0, H1 + H2 + H3])
            cylinder(r1 = R1, r2 = R - thick + 0.4, h = 3, $fn = fn);
    }
    translate([0, 0, -H + R - 1])
        sphere(r = R - thick, $fn = fn);
    translate([0, 0, -H + R - 1])
        cylinder(r = R - thick, h = 100, $fn = fn);
    translate([-100, -100, -H - 100])
        cube([200, 200, 100]);
    translate([0, 0, -H])
        cylinder(r = 2, h = thick, $fn = 16);
}

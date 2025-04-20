W = 10;
D = 171;
H = 80;
thick = 3;

difference() {
    union() {
        translate([0, 0, -H - thick * 2])
            cube([W, D + thick * 2, H + thick * 2]);
        translate([0, -30, -thick])
            cube([W, D + thick * 2 + 60, thick]);
    }
    translate([-1, thick, -H - thick])
        cube([W + 2, D, H]);
    for (y = [-20, 20 + thick, D + thick - 20, D + thick * 2 + 20])
            translate([W / 2, y, -thick - 1])
            cylinder(r1 = 5, r2 = 0, h = 5);
}
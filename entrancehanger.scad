thick = 1.5;
gap = 24.5;
W = 20;
H = 60;

difference() {
    intersection() {
        cube([W, thick * 4 + gap, H]);
        translate([W / 2, 0, H])
            sphere(r = H, h = H, $fn = 64);
    }
    translate([0, thick * 2, 0])
        cube([W, gap, H - thick]);
}

intersection() {
    difference() {
        translate([W / 2, 0, H])
            sphere(r = H, h = H, $fn = 64);
        translate([W / 2, 0, H + 30])
            sphere(r = H + 30 - thick * 3, h = H, $fn = 64);
    }
    translate([0, -H / 2, 0])
        cube([W, H / 2, H]);
}
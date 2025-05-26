base = 6;
R = 2.1;

difference() {
    translate([-10, 0, 0])
        cube([11.8, 6, base + 9]);
    translate([0, 0, base])
        cube([1.8, 8, 9]);
    translate([2, 4, base * .5])
        rotate([0, -90, 0])
            cylinder(r = 1.5, h = 2.5, $fn = 32);
    translate([-6, 4, -2])
        rotate([180, 0, 0])
            sarakineji_hole();
}
translate([0, 4, base + 6.5])
    rotate([0, 90, 0])
        cylinder(r = R, h = 1.8, $fn = 32);

translate([8, 0, 0]) {
    difference() {
        translate([2, 0, 0])
            cube([8, 8, base + 9]);
        translate([6, 4, -2])
            rotate([180, 0, 0])
                sarakineji_hole();
    }
    translate([2, 4, base * .5])
        rotate([0, -90, 0])
            cylinder(r = 1.28, h = 2, $fn = 16);
}

module sarakineji_hole () {
    union() {
        translate([0, 0, -3.7])
            cylinder(r1 = 0, r2 = 3.7, h = 3.7, $fn = 32);
        translate([0, 0, -11.7])
            cylinder(r = 1.3, h = 11.7, $fn = 16);
    }
}

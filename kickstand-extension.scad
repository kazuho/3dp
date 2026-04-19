RpipeIn = 7.5 / 2;
Rpipe = 11 / 2;
H = 30;
fn = 128;

difference() {
    union() {
        translate([0, 0, -H])
            cylinder(r = Rpipe, h = H, $fn = fn);
        cylinder(r = RpipeIn, h = 20, $fn = fn);
    }
    translate([-50, -50, -50])
        cube([50, 100, 100]);
    translate([0, 0, -H])
        cylinder(r = 3.5, h = H + 20 - 30, $fn = fn);
    translate([0, 0, -H])
        cylinder(r = 1.5, h = H + 20, $fn = fn);
}

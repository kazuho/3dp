RpipeIn = 7.6 / 2;
Rpipe = 11 / 2;
H = 30;
fn = 128;

difference() {
    union() {
        translate([0, 0, -H])
            cylinder(r = Rpipe, h = H, $fn = fn);
        rotate([4, 0, 0])
            translate([0, 0, -2])
                cylinder(r = RpipeIn, h = 22, $fn = fn);
    }
    translate([-50, -50, -50])
        cube([50, 100, 100]);
}

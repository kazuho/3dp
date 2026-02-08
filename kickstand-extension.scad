inR = 10 / 2;
outR = 11 / 2;
inH = 20;
outH = 35;
fn = 128;

difference() {
    cylinder(r = outR, h = outH, $fn = fn);
    cylinder(r = outR - 2, h = outH, $fn = fn);
    translate([0, 0, outH - inH])
        cylinder(r = inR, h = outH, $fn = fn);
    cube([outR, 1, outH]);
}

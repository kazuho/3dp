W = 250;
D = 81;
H = 45;
R = 13;
fn = 32;
thick = 3;

difference() {
    hull() {
        for(x = [R, W - R])
            for (y = [R, D - R])
                translate([x, y, 0])
                    cylinder(r = R, h = H, $fn = 32);
    }
    hull() {
        for(x = [R, W - R])
            for (y = [R, D - R])
                translate([x, y, thick])
                    cylinder(r = R - thick, h = H, $fn = 32);
    }
    for (i = [1:11]) {
        hull() {
            translate([W / 12 * i, 15, 0])
                cylinder(r = 5, h = thick, $fn = 16);
            translate([W / 12 * i, D - 15, 0])
                cylinder(r = 5, h = thick, $fn = 16);
        }
    }
    translate([0, D / 2, D * 2])
        rotate([0, 90, 0])
            cylinder(r = D * 2 - H + R, h = W, $fn = 64);
}

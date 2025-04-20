H = 105;
S = 140;
pillarH = 20;
thick = 3;
coreR = 15;


difference() {
    union () {
        cylinder(r = coreR, h = H, $fn = 64);
        translate([0, 0, H - 5])
            cylinder(r1 = coreR, r2 = coreR + 5, h = 3, $fn = 64);
        translate([0, 0, H - 2])
            cylinder(r = coreR + 5, h = 2, $fn = 64);

        for (x = [-1, 1]) {
            difference () {
                translate([x * S * cos(60), -S * sin(60), 0])
                    cylinder(r = coreR, h = H, $fn = 64);
                translate([x * S * cos(60), -S * sin(60), thick])
                    cylinder(r = coreR - thick, h = H - thick, $fn = 64);
                for (z = [0:3]) {
                    translate([x * S * cos(60), -S * sin(60), pillarH + 10 + (H - pillarH - 20) / 3 * z])
                        rotate([-90, 0, 0])
                            cylinder(r = 3, h = 100, $fn = 16);
                }
            }
            difference() {
                hull() {
                    cylinder(r = coreR, h = pillarH, $fn = 64);
                    translate([x * S * cos(60), -S * sin(60), 0])
                        cylinder(r = coreR, h = pillarH, $fn = 64);
                }
                hull() {
                    translate([0, 0, thick]) {
                        cylinder(r = coreR - thick, h = pillarH, $fn = 64);
                        translate([x * S * cos(60), -S * sin(60), 0])
                            cylinder(r = coreR - thick, h = pillarH, $fn = 64);
                    }
                }
            }
        }
    }

    cylinder(r = coreR - thick, h = H, $hn = 64);
    translate([-100, -S * sin(60) - 100, 0])
        cube([500, 100, 500]);
}

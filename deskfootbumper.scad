slitW = 91.4;
slitH = 3;
slitD = 10;
slitR = 10;
slitAngle = 30;
thick = 2;
W = slitW + thick * 2;
D = slitD + thick;
H = slitH + 20;
R = slitR;

difference() {
    translate([0, D, slitH / 2]) {
        rotate([-slitAngle, 0, 0]) {
            translate([0, -D, -slitH / 2]) {
                hull() {
                    intersection() {
                        for (x = [R, W - R])
                            for (z = [-4.5, slitH + 5.5])
                                translate([x, R, z])
                                    sphere(r = R, $fn = 64);
                        translate([0, 0, -R - 4.5])
                            cube([W, D, R * 2 + slitH + 10]);
                    }
                }
            }
        }
    }
    translate([thick, thick, 0]) {
        hull() {
            intersection() {
                for (x = [slitR, slitW - slitR])
                    translate([x, slitR, 0])
                        cylinder(r = slitR, h = slitH, $fn = 64);
                cube([slitW, slitD, slitH]);
            }
            translate([0, slitD, 0])
                cube([slitW, 100, slitH]);
        }
    }
}
W = 150;
D = 150;
H = 70;
thick = 1.6;
R = thick * 3;

difference() {
    union() {
        difference() {
            union() {
                hull() {
                    for (x = [R, W - R])
                        for (y = [R, D - R])
                            translate([x, y, 0])
                                cylinder(r = R - thick * 2, h = 5, $fn = 32);
                }
                hull() {
                    for (x = [R, W - R])
                        for (y = [R, D - R])
                            translate([x, y, 5])
                                cylinder(r1 = R - thick * 2, r2 = R, h = thick * 2, $fn = 32);
                }
                hull() {
                    for (x = [R, W - R])
                        for (y = [R, D - R])
                            translate([x, y, 5 + thick * 2])
                                cylinder(r = R, h = H - 5 - thick * 2, $fn = 32);
                }
            }
            hull() {
                for (x = [R, W - R])
                    for (y = [R, D - R])
                        translate([x, y, 5 + thick * 3])
                            cylinder(r = R - thick, h = H - 5 - thick * 3, $fn = 32);
            }
            hull() {
                for (x = [R, W - R])
                    for (y = [R, D - R])
                        translate([x, y, 5 + thick])
                            cylinder(r1 = R - thick * 3, r2 = R - thick, h = thick * 2, $fn = 32);
            }
            translate([R, R, thick])
                cube([W - R * 2, D - R * 2, H - thick]);

            slits(W, D);
            translate([W / 2, D/ 2, 0])
                rotate([0, 0, 90])
                    translate([-D / 2, -W / 2, 0])
                        slits(D, W);
        }

        holder();
        translate([W, 0, 0])
            mirror([1, 0, 0])
                holder();
        translate([0, D, 0])
            mirror([0, 1, 0])
                holder();
        translate([W, D, 0])
            mirror([1, 1, 0])
                holder();
    }

    if (1) {
        hull() {
            translate([R * 3 + thick, 0, 5 + thick * 3 + R])
                rotate([-90, 0, 0])
                    cylinder(r = R, h = thick, $fn = 32);
            translate([W - (R * 3 + thick), 0, 5 + thick * 3 + R])
                rotate([-90, 0, 0])
                    cylinder(r = R, h = thick, $fn = 32);
            translate([R * 2 + thick, 0, H - 1])
                cube([W - (R * 2 + thick) * 2, thick, 1]);
        }
        difference() {
            translate([thick + R, 0, H - R])
                cube([R, R, R]);
            translate([thick + R, 0, H - R])
                rotate([-90, 0, 0])
                    cylinder(r = R, h = R, $fn = 32);
        }
        difference() {
            translate([W - thick - R * 2, 0, H - R])
                cube([R, R, R]);
            translate([W - thick - R, 0, H - R])
                rotate([-90, 0, 0])
                    cylinder(r = R, h = R, $fn = 32);
        }
    }
}

module slits(w, d) {
    for (x = [1:5]) {
        translate([w / 6 * x, 0, 15 + (x % 2 == 0 ? 5 : 0)]) {
            hull() {
                rotate([-90, 0, 0])
                    cylinder(r = 2, h = d, $fn = 16);
                translate([0, 0, H - 30 - (x % 2 != 0 ? 5 : 0)])
                    rotate([-90, 0, 0])
                        cylinder(r = 2, h = d, $fn = 16);
            }
        }
    }
}

module holder() {
    intersection() {
        translate([thick, thick, H - 5 - R * 2 - 1]) {
            cylinder(r1 = 0, r2 = R * 2, h = R * 2, $fn = 32);
            translate([0, 0, R * 2])
                cylinder(r = R * 2, h = 1, $fn = 32);
        }
        union() {
            translate([R, R, 0])
                cylinder(r = R, h = H, $fn = 32);
            translate([R, 0, 0])
                cube([W, D, H]);
            translate([0, R, 0])
                cube([W, D, H]);
        }
    }
}

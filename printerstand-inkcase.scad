R = 40;
W = 410;
D = 220;
H = 60;
paperX = 140;
thick = 4;

thickCase = 2;
spaceCase = 1;
Wcase = 110 + thickCase * 2;
Xcase = paperX - thick - spaceCase - Wcase;

if (0) { // drawer
    difference() {
        intersection() {
            base();
            translate([Xcase, 0, 0])
                cube([paperX - Xcase, D, H]);
            cube([W, D, H - spaceCase * 2]);
        }
        translate([Xcase + Wcase, thickCase, 0])
            cube([W, D, H]);
        translate([R, R, H - 10])
            cylinder(r = R - thickCase, h = H - thickCase, $fn = 128);
        difference() {
            translate([R, R, thickCase])
                cylinder(r = R - thickCase, h = H, $fn = 128);
            translate([Xcase, 0, 0])
                cube([thickCase, D, H]);
        }
        translate([R, thickCase, H - 10])
            cube([Xcase + Wcase - R, D, H]);
        translate([R, thickCase, thickCase])
            cube([Xcase + (Wcase - thickCase) - R, D - thickCase * 2, H]);
        translate([Xcase, R, H - 10])
            cube([W, D, H]);
        translate([Xcase + thickCase, R, thickCase])
            cube([R, D - R - thickCase, H]);
        translate([(paperX + Xcase) / 2, 0, 0])
            sphere(r = 15, $fn = 64);
    }
    intersection() {
        translate([(paperX + Xcase) / 2, -15, 0]) {
            difference() {
                sphere(r = 30 + thickCase, $fn = 64);
                sphere(r = 30, $fn = 64);
            }
        }
        cube([W, D, H]);
    }
} else if (0) { // case
    difference() {
        base();
        translate([0, R * 1.5, 0])
            cube([W, D, H]);
        translate([paperX, 0, 0])
            cube([W, D, H]);
        translate([Xcase - spaceCase, 0, 0])
            cube([Wcase + spaceCase * 2, D, H - thick]);
        translate([R, 0, 0])
            cube([W, thickCase + 1, H]);
        difference() {
            translate([R, R, H - thick])
                cylinder(r = R, h = thick, $fn = 128);
            translate([R, R, H - thick])
                cylinder(r = R - (thickCase + 1), h = thick, $fn = 128);
            translate([0, 0, 0])
                cube([Xcase - spaceCase, D, H]);
            translate([R, 0, 0])
                cube([R, D, H]);
        }
        translate([paperX - thick, R - 10.5, 0])
            cube([thick, 21, thick + 1]);
        translate([paperX - thick, R - 10.5, 0])
            cube([thick * .5 + 0.5, 21, 10]);
    }
} else if (0) { // right foot
    difference() {
        translate([R, 0, 0]) {
            mirror([1, 0, 0]) {
                intersection() {
                    base();
                    cube([R, R * 1.5, H]);
                }
            }
        }
        translate([0, R - 10.5, 0])
            cube([thickCase, 21, thick + 1]);
        intersection() {
            translate([0, R, 0])
                cylinder(r = R - thickCase, h = H - thick, $fn = 128);
            translate([thickCase, thickCase, 0])
                cube([R - thickCase * 2, R * 1.5 - thickCase * 2, H - thick]);
        }
        translate([thickCase, R, 0])
            cube([R - thickCase * 2, R * 0.5 - thickCase, H - thick]);
        translate([R - 10.5 - thickCase, R * 1.5 - thickCase, 0])
            cube([10.5, thickCase, thickCase + 1]);
    }
} else if (0) { // paper case floor
    Wfloor = 236;
    difference() {
        union() {
            rotate([0, 90, 0])
                linear_extrude(Wfloor)
                    polygon([[0, 0], [-thick, 0], [-thick, 50], [0, 50 + thick * 2]]);
            translate([-thickCase * 2, 30])
                cube([Wfloor + thickCase * 4, 20, thick]);
            for (x = [-thickCase * 2, Wfloor + thickCase])
                translate([x, 30, 0])
                    cube([thickCase, 20, thick * 1.75]);
        }
        translate([10, 0, 0])
            cube([Wfloor - 20, 10, thick]);
        for (x = [10 - thick, Wfloor - 10])
            translate([x, thick / 2 + 0.6, thick / 2])
                rotate([0, 90, 0])
                    cylinder(r = thick / 2 - 0.4, h = thick, $fn = 32);
    }
} else { // paper case door
    Wfloor = 235;
    difference() {
        union() {
            translate([10, H - 3, 2])
                rotate([0, 90, 0])
                    cylinder(r = 2, h = Wfloor - 20, $fn = 16);
            cube([Wfloor, H - 1.5 - thick, 2]);
            translate([10, 0, 0])
                cube([Wfloor - 20, H - 3, 2]);
            for (x = [10, Wfloor - 10])
                translate([x, H - 3, 2])
                    sphere(r = 1.5, $fn = 16);
            for (x = [0, Wfloor - 2]) {
                intersection() {
                    translate([x, H - 1.5 - thick, thick])
                        rotate([0, 90, 0])
                            cylinder(r = H - 10, h = 2, $fn = 64);
                    translate([x, 0, 0])
                        cube([thick, H - 1.5 - thick, H]);
                }
            }
        }
        translate([Wfloor / 2, 0, 0])
            cylinder(r = 15, h = 2, $fn = 64);
    }
}

module base() {
    union() {
        intersection() {
            translate([R, R, 0])
                cylinder(r = R, h = H, $fn = 128);
            cube([R, R, H]);
        }
        translate([R, 0, 0])
            cube([paperX - R, D, H]);
        translate([0, R, 0])
            cube([R, D - R, H]);
    }
}

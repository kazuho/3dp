thick = 2;
mbW = 52;
mbD = 174.5;
mbH = 174;
mbBackplateH = 164;
mbScrewX = thick + 45;
mbScrew1Y = 37;
mbScrew1Z = thick + 10;
mbScrew2Y = mbD - 5;
mbScrew2Z = mbScrew1Z;
mbScrew3Y = 15;
mbScrew3Z = thick + mbH - 6;
mbScrew4Y = mbD - 5;
mbScrew4Z = mbScrew3Z;
powerW = 64.5;
powerD = 125.5;
powerH = 100.5;
powerY = mbD + 5;
videoX = thick + powerW + 6;

rearD = mbD + 20;
H = thick + mbH + 6 + thick;

difference() {
    difference() {
        hull() {
            for (z = [thick, H - thick])
                translate([thick, 0, z])
                    rotate([-90, 0, 0])
                        cylinder(r = thick, h = rearD, $fn = 32);
            translate([videoX - 1, 0, 0])
                cube([1, rearD, H]);
        }
        // inner
        difference() {
            translate([thick, thick, thick])
                cube([videoX - thick, rearD - thick, H - thick * 2]);
            translate([videoX - thick * 2, 0, 0])
                cube([thick * 2, 20, H]);
            translate([videoX - thick * 2, 0, H - 20])
                cube([thick * 2, rearD, 20]);
            translate([videoX - 10, 0, 0])
                cube([10, rearD, 10]);
            translate([videoX - 10, 0, 0])
                cube([10, 10, H]);
            translate([videoX - 10, 0, H - 10])
                cube([10, rearD, 10]);
            translate([videoX - 10, rearD - 30, 0])
                cube([10, 10, H]);
        }
    }
    // video screwholes
    for (i = [0:10]) {
        videoScrewHole(30 * i + 7, 7);
        videoScrewHole(30 * i + 7, H - 7);
    }
    for (i = [0:5]) {
        videoScrewHole(7, 30 * i + 7);
        videoScrewHole(rearD - 25, 30 * i + 7);
    }
    // mb backplate
    translate([thick + 1, 0, thick])
        cube([mbW - 1, thick, mbBackplateH]);
    // side holes
    for (y = [0:2]) {
        for (z = [0:4]) {
            translate([0, 40 + y * 50, 30 + z * 28.8])
                rotate([0, 90, 0])
                    rotate([0, 0, 30])
                        cylinder(r = 14, h = thick, $fn = 6);
            if (z < 4) {
                translate([0, 65 + y * 50, 44.4 + z * 28.8])
                    rotate([0, 90, 0])
                        rotate([0, 0, 30])
                            cylinder(r = 14, h = thick, $fn = 6);
            }
        }
    }
    // top holes
    for (y = [0:2]) {
        for (x = [0:1]) {
            translate([25 + x * 28.8, 40 + y * 50, H - thick])
                rotate([0, 0, 30])
                    cylinder(r = 14, h = thick, $fn = 6);
            if (x == 0 && y < 2) {
                translate([39.4 + x * 28.8, 65 + y * 50, H - thick])
                    rotate([0, 0, 30])
                        cylinder(r = 14, h = thick, $fn = 6);
            }
        }
    }
    // front screw holes
    for (x = [thick + 10, thick + 20]) {
        translate([x, rearD - 10, 0])
            rotate([180, 0, 0])
                sarakineji_hole();
        translate([x, rearD - 10, H])
                sarakineji_hole();
    }
    for (z = [15, 25, H - 25, H - 15]) {
        translate([videoX - 5, rearD - 20, z])
            rotate([-90, 0, 0])
                nabeneji_hole();
    }
    translate([videoX - 10, rearD - 20, H - 20])
        cube([10, 20, 10]);
    // mb screw holes
    for (x = [mbScrewX - 6, mbScrewX + 6]) {
        translate([x, mbScrew1Y, 0])
            rotate([180, 0, 0])
                sarakineji_hole();
        translate([x, mbScrew2Y, 0])
            rotate([180, 0, 0])
                sarakineji_hole();
        translate([x, mbScrew3Y, H])
            sarakineji_hole();
        translate([x, mbScrew4Y, H])
            sarakineji_hole();
    }
}

// build plate adhersion
translate([videoX, 0, 0])
    rotate([-90, 0, 0])
        cylinder(r = 10, h = 0.2, $fn = 32);
translate([videoX, 0, H])
    rotate([-90, 0, 0])
        cylinder(r = 10, h = 0.2, $fn = 32);

module videoScrewHole(y, z) {
    translate([videoX, y, z])
        rotate([0, 90, 0])
            nabeneji_hole();
}

module nabeneji_hole() {
    translate([0, 0, -10])
        cylinder(r = 1.3, h = 10, $fn = 16);
}

module sarakineji_hole () {
    union() {
        translate([0, 0, -3.7])
            cylinder(r1 = 0, r2 = 3.7, h = 3.7, $fn = 32);
        translate([0, 0, -11.7])
            cylinder(r = 1.3, h = 11.7, $fn = 16);
    }
}


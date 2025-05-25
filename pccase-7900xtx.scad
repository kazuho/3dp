thick = 2;
mbW = 52;
mbD = 173.5;
mbH = 174;
mbBackplateH = 164;
mbScrewX = thick + 42;
mbScrew1Y = 35;
mbScrew1Z = thick + 10;
mbScrew2Y = mbD - 5;
mbScrew2Z = mbScrew1Z;
mbScrew3Y = 16;
mbScrew3Z = thick + mbH - 6;
mbScrew4Y = mbD - 5;
mbScrew4Z = mbScrew3Z;
powerW = 64.5;
powerD = 125.5;
powerH = 100.5;
powerY = mbD + 5;
videoX = thick + powerW + 6;
videoZ = 55;
videoFanZ = videoZ + 1;
videoBracketZ = videoZ + 91;

W = videoX + 45;
rearD = mbD + 20;
H = thick + mbH + 3 + thick;

difference() {
    union() {
        hull() {
            for (x = [thick, videoX - thick])
                for (z = [thick, H - thick])
                    translate([x, 0, z])
                        rotate([-90, 0, 0])
                            cylinder(r = thick, h = rearD, $fn = 32);
        }
        hull() {
            for (x = [thick, W - thick])
                for (z = [thick, videoBracketZ + 13 - thick])
                    translate([x, 0, z])
                        rotate([-90, 0, 0])
                            cylinder(r = thick, h = rearD, $fn = 32);
        }
    }
    translate([videoX, thick * 3, videoZ])
        cube([W - videoZ, rearD, H - videoZ]);
    // mb
    translate([thick, thick, thick])
        cube([videoX - thick * 3, rearD - thick, H - thick * 2]);
    translate([thick, 0, thick])
        cube([mbW, thick, mbBackplateH]);
    translate([videoX - thick * 2, thick * 3, thick])
        cube([thick * 2, rearD - thick * 3, H - thick * 4]);
    // power cord hole
    translate([thick + mbW, 0, thick])
        cube([8, thick, 3]);
    // power
    difference() {
        translate([thick, mbD, thick])
            cube([videoX - thick, 100, H - thick * 2]);
        translate([videoX - thick * 2, mbD, H - thick * 3])
            cube([thick * 2, 100, thick * 2]);
    }
    // video
    translate([videoX, thick * 3, thick])
        cube([30 - thick, rearD - thick * 3, videoZ - thick]);
    translate([videoX + 30 - thick, thick * 3, 40])
        cube([thick, rearD - thick * 3, H - 40]);
    translate([videoX + 30, thick * 3, 0])
        cube([100, rearD - thick * 3, videoZ]);
    translate([videoX + 30 - thick, 0, 0])
        rotate([0, 90, 0])
            linear_extrude(thick)
                polygon([[-40, thick * 3], [-15, thick * 3], [-15, thick * 5], [-40, thick * 5 + 25]]);
    // video bracket
    translate([videoX - 1, 0, videoBracketZ])
        cube([40.5, thick * 3, 3]);
    // video bracket hole
    hull() {
        for (z = [30, videoBracketZ - 20]) {
            translate([videoX + 20 - thick, 0, z])
                rotate([-90, 0, 0])
                    cylinder(r = 10, h = thick * 3, $fn = 6);
        }
    }
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
        translate([25, 40 + y * 50, H - thick])
            rotate([0, 0, 30])
                cylinder(r = 14, h = thick, $fn = 6);
        if (y < 2) {
            translate([39.4, 65 + y * 50, H - thick])
                rotate([0, 0, 30])
                    cylinder(r = 14, h = thick, $fn = 6);
        }
    }
    // front screw holes
    for (x = [thick + 10, thick + 20, videoX - 20, videoX - 10]) {
        translate([x, rearD - 10, 0])
            rotate([180, 0, 0])
                sarakineji_hole();
        translate([x, rearD - 10, H])
                sarakineji_hole();
    }
    // mb screw holes
    for (x = [mbScrewX - 5, mbScrewX + 7]) {
        translate([x, mbScrew1Y, 0])
            rotate([180, 0, 0])
                sarakineji_hole();
        translate([x, mbScrew3Y, H])
            sarakineji_hole();
    }
}

// motherboard screwholes
difference() {
    translate([mbScrewX - 15, mbScrew2Y - 4, thick])
        cube([18, 8, mbScrew2Z + 4 - thick]);
    translate([mbScrewX, mbScrew2Y - 4, mbScrew2Z - 6])
        cube([30, 30, 30]);
    mbScrewHole(mbScrew2Y, mbScrew2Z);
}
difference() {
    translate([mbScrewX - 15, mbScrew4Y - 4, mbScrew4Z - 4])
        cube([18, 8, H - (mbScrew4Z - 4)]);
    translate([mbScrewX, mbScrew4Y - 4, mbScrew4Z - 4])
        cube([30, 30, (thick + mbH) - (mbScrew4Z - 4)]);
    mbScrewHole(mbScrew4Y, mbScrew4Z);
}

module sarakineji_hole () {
    union() {
        translate([0, 0, -3.7])
            cylinder(r1 = 0, r2 = 3.7, h = 3.7, $fn = 32);
        translate([0, 0, -11.7])
            cylinder(r = 1.3, h = 11.7, $fn = 16);
    }
}

module mbScrewHole(y, z) {
    translate([mbScrewX, y, z])
        rotate([0, -90, 0])
            cylinder(r = 1.3, h = 12, $fn = 16);
}

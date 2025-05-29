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
powerZ = 30;
videoX = thick + powerW + 6;

rearD = mbD + 20;
frontD = 350 - rearD;
D = rearD + frontD;
H = thick + mbH + 6 + thick;

// rear
if (1) {
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
}

// front
if (1) {
    translate([0, 50, 0]) {
        difference() {
            hull() {
                for (z = [thick, H - thick])
                    translate([thick, rearD - 19.8, z])
                        rotate([-90, 0, 0])
                            cylinder(r = thick, h = frontD + 19.8, $fn = 32);
                translate([videoX - 1, rearD - 19.8, 0])
                    cube([1, frontD + 19.8, H]);
            }
            // rear joint
            cube([videoX, rearD + 0.2, thick + 0.2]);
            cube([thick + 0.2, rearD + 0.2, H]);
            translate([0, 0, H - thick - 0.2])
                cube([videoX, rearD + 0.2, thick + 0.2]);
            for (z = [0, H - 10.2])
                translate([videoX - 10.2, 0, z])
                    cube([10.2, rearD, 10.2]);
            // inner
            difference() {
                translate([thick, rearD - 19.8, thick])
                    cube([videoX - thick, frontD + 19.8 - thick, H - thick * 2]);
                translate([videoX - 10, rearD + 0.2, 0])
                    cube([10, frontD - 0.2, 10]);
                translate([videoX - thick * 2, rearD + 0.2, 0])
                    cube([thick * 2, frontD - 0.2, powerZ]);
                translate([videoX - 10, rearD + 0.2, H - 10])
                    cube([10, frontD - 0.2, 10]);
                translate([thick + powerW, D - 10, 0])
                    cube([10, 10, H]);
                translate([videoX - thick * 2, D - 20, 0])
                    cube([thick * 2, 20, H]);
                linear_extrude(H)
                    polygon([[thick, rearD - 20], [thick, rearD + thick * 2], [thick * 2, rearD + thick], [thick * 2, rearD - 20]]);
                rotate([0, 90, 0]) {
                    linear_extrude(videoX)
                        polygon([[-thick, rearD - 20], [-thick, rearD + thick * 2], [-thick * 2, rearD + thick], [-thick * 2, rearD - 20]]);
                    linear_extrude(videoX)
                        polygon([[-H + thick, rearD - 20], [-H + thick, rearD + thick * 2], [-H + thick * 2, rearD + thick], [-H + thick * 2, rearD - 20]]);
                }
                difference() {
                    translate([videoX - 10.2 - thick, 0, 0])
                        cube([thick + 10.2, rearD + thick * 2, H]);
                    translate([videoX - 10.2 - thick, rearD - 19.8 + thick, 10.2 + thick])
                        cube([10.2, 100, H - (10.2 + thick) * 2]);
                }
                // power
                translate([0, D - thick - powerD , 0])
                    cube([videoX, powerD, powerZ]);
                // rear screw holes
                for (z = [0, H - 12])
                    translate([0, rearD - 14, z])
                        cube([24, 8, 12]);
            }
            // power
            difference() {
                translate([thick, D - thick - powerD, 0])
                    cube([videoX - thick * 3, powerD, powerZ - thick]);
                translate([videoX - 10, 0, 0])
                    cube([10, D, 10]);
            }
            translate([thick * 2, D - thick - powerD + 10, powerZ - thick])
                cube([powerW - thick * 2, powerD - 20, thick]);
            // rear screw holes
            for (x = [thick + 10, thick + 20]) {
                translate([x, rearD - 10, 0])
                    rotate([180, 0, 0])
                        sarakineji_hole();
                translate([x, rearD - 10, H])
                        sarakineji_hole();
            }
            for (z = [15, 25, H - 25, H - 15]) {
                translate([videoX - 5, rearD - 19.8, z])
                    rotate([90, 0, 0])
                        nabeneji_hole();
            }
            // power screw holes
            for (x = [thick + 6, thick + powerW - 6])
                for (y = [D - thick - powerD + 6, D - thick - 6])
                    translate([x, y, powerZ])
                        nabeneji_hole();
            // video screwholes
            for (i = [7:11]) {
                videoScrewHole(30 * i + 7, 7);
                videoScrewHole(30 * i + 7, H - 7);
            }
            for (i = [0:5])
                videoScrewHole(D - 7, 30 * i + 7);
            // side holes
            for (y = [3:5]) {
                for (z = [-1:4]) {
                    if (y > 3 && z > 0) {
                        translate([0, 40 + y * 50, 30 + z * 28.8])
                            rotate([0, 90, 0])
                                rotate([0, 0, 30])
                                    cylinder(r = 14, h = thick, $fn = 6);
                    }
                    if (z < 4 && (z > -1 || y == 4)) {
                        translate([0, 65 + y * 50, 44.4 + z * 28.8])
                            rotate([0, 90, 0])
                                rotate([0, 0, 30])
                                    cylinder(r = 14, h = thick, $fn = 6);
                    }
                }
            }
            // top holes
            for (y = [3:5]) {
                for (x = [0:1]) {
                    if (y > 3) {
                        translate([25 + x * 28.8, 40 + y * 50, H - thick])
                            rotate([0, 0, 30])
                                cylinder(r = 14, h = thick, $fn = 6);
                    }
                    if (x == 0) {
                        translate([39.4 + x * 28.8, 65 + y * 50, H - thick])
                            rotate([0, 0, 30])
                                cylinder(r = 14, h = thick, $fn = 6);
                    }
                }
            }
            // front holes
            translate([thick * 2, D - thick, thick * 2])
                cube([thick * 4, thick, H - thick * 4]);
            for (z = [thick * 2, H - thick * 4])
                translate([thick * 2, D - 1, z])
                    cube([videoX - thick * 2, 1, thick * 2]);
        }
        // build plate adhersion
        difference() {
            union() {
                translate([videoX, D, 0])
                    rotate([90, 0, 0])
                        cylinder(r = 10, h = 0.2, $fn = 32);
                translate([videoX, D, H])
                    rotate([90, 0, 0])
                        cylinder(r = 10, h = 0.2, $fn = 32);
            }
            cube([videoX, D, H]);
        }
    }
}

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


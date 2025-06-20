R = 20;
thick = 2;
mbY = 10;
mbW = 52;
mbD = 174.5;
mbH = 174;
mbBackplateH = 164;
mbScrewX = thick + 47;
mbScrew1Y = mbY + 37;
mbScrew1Z = thick + 10;
mbScrew2Y = mbY + mbD - 5;
mbScrew2Z = mbScrew1Z;
mbScrew3Y = mbY + 15;
mbScrew3Z = thick + mbH - 6;
mbScrew4Y = mbY + mbD - 5;
mbScrew4Z = mbScrew3Z;
powerW = 64.5;
powerD = 125.5;
powerH = 100.5;
powerZ = 30;
videoX = thick + powerW + 6;
videoW = 59;

W = thick + powerW + 6 + videoW + 1 + thick;
D = 365;
H = thick + mbH + 21 + thick;

panelHoleInterval = 90;
panelHoleY = (D - panelHoleInterval * 3) / 2;
rearD = panelHoleY + panelHoleInterval * 2;

if (0) {
    intersection() {
        main();
        // rear
        if (0) {
            linear_extrude(H)
                polygon([[0, 0], [0, rearD - 4.2],
                        [thick + 2.2, rearD - 4.2], [thick + 2.2, rearD + 3.8],
                        [W - (thick + 2.2), rearD + 3.8], [W - (thick + 2.2), rearD - 4.2],
                        [W, rearD - 4.2], [W, 0]]);
        }
        // front
        if (1) {
            linear_extrude(H)
                polygon([[0, D], [0, rearD - 4],
                        [thick + 2, rearD - 4], [thick + 2, rearD + 4],
                        [W - (thick + 2), rearD + 4], [W - (thick + 2), rearD - 4],
                        [W, rearD - 4], [W, D]]);
        }
    }
    // build plate adhersion
    for (y = [rearD, D])
        for (z = [0, H])
            translate([0, y, z])
                rotate([0, 90, 0])
                    cylinder(r = R, h = 0.2, $fn = 32);
} else {
    // video harness
    difference() {
        intersection() {
            union() {
                // front
                if(0) translate([videoX, D - 70, 0])
                    cube([10, 70, 70]);
                // rear
                translate([videoX, 0, 0])
                    cube([45, 40, H]);
            }
            // hull
            hull() {
                for (y = [R, D - R])
                    for (z = [R, H - R])
                        rotate([0, 90, 0])
                            translate([-z, y, 0])
                                cylinder(r = R - thick - 0.2, h = W, $fn = 64);
            }
        }
        // front
        translate([videoX, D - 70, 17])
            cube([2, 50, 70]);
        translate([videoX + 2, D - 70, 22])
            cube([10, 50, 70]);
        // rear
        translate([0, 0, H - 155]) {
            rotate([-11, 0, 0]) {
                cube([W, 100, 200]);
                translate([videoX, -14, 117])
                    cube([40, 14, 3]);
            }
        }
        cube([W, 100, 120]);
        // video card screw holes
        for (z = [7, H - 7]) {
            for (i = [0:8]) {
                translate([videoX + 2, R + (D - R * 2) / 8 * i, z]) {
                    rotate([0, 90, 0]) {
                        saraneji_hole();
                        cylinder(r = 4, h = W, $fn = 32);
                    }
                }
            }
        }
        for (y = [7, D - 7]) {
            for (i = [0:4]) {
                translate([videoX + 2, y, R + (H - R * 2) / 4 * i]) {
                    rotate([0, 90, 0]) {
                        saraneji_hole();
                        cylinder(r = 4, h = W, $fn = 32);
                    }
                }
            }
        }
    }
}

module main() {
    difference() {
        hull() {
            for (y = [R, D - R])
                for (z = [R, H - R])
                    rotate([0, 90, 0])
                        translate([-z, y, 0])
                            cylinder(r = R, h = W, $fn = 64);
        }
        difference() {
            hull() {
                for (y = [R, D - R])
                    for (z = [R, H - R])
                            rotate([0, 90, 0])
                                translate([-z, y, 0])
                                    cylinder(r = R - thick, h = W, $fn = 64);
            }
            // bottom split
            translate([videoX - 10, 0, 0])
                cube([10, rearD + 2, 10]);
            translate([0, rearD + 2, 0])
                rotate([-90, 0, 0])
                    linear_extrude(D - (rearD + 2))
                        polygon([[videoX - 20, 0], [videoX - 20, -thick], [videoX - thick * 2, -powerZ],
                                 [videoX , -powerZ], [videoX, 0]]);
            // rear split
            translate([videoX - 10, 0, 0])
                cube([10, 20, H]);
            // top split
            rotate([-90, 0, 0])
                linear_extrude(D)
                    polygon([[videoX - 20, -H], [videoX, -H], [videoX, -H + 10], [videoX - 10, -H + 10]]);
            translate([videoX - thick * 2, 0, H - 30])
                cube([thick * 2, rearD + 2, 30]);
            // mid split
            difference() {
                translate([videoX - 10, rearD + 2, 0])
                    cube([10, 10, H]);
                translate([thick, D - thick * 2 - powerD, powerZ])
                    cube([powerW, powerD, powerH]);
                intersection() {
                    translate([0, 0, powerZ])
                        linear_extrude(powerH)
                            polygon([[videoX - thick * 2, rearD + 12], [videoX - 10, rearD + 2 + thick * 2],
                                    [videoX - 10, rearD + 12]]);
                    translate([0, D - thick * 2 - powerD, 0])
                        cube([W, 100, H]);
                }
            }
            // front split
            translate([videoX - thick * 2, D - 20, 0])
                cube([thick * 2, 20, H]);
            difference() {
                linear_extrude(H)
                    polygon([[videoX - 20, D], [videoX - thick * 2, D - 20 + thick * 2], [videoX, D - 20 + thick * 2], [videoX, D]]);
                translate([thick, D - thick * 2 - powerD, powerZ])
                    cube([powerW, powerD, powerH]);
            }
            translate([thick, D - 10, powerZ + powerH])
                cube([videoX - thick, 10, thick]);
            // mb rear
            cube([videoX, mbY, H]);
            // power
            difference() {
                translate([thick, rearD + 2, 0])
                    cube([videoX - thick, D - (rearD + 2) , powerZ]);
                translate([thick, D - thick * 2 - powerD + thick, 0])
                    cube([thick, powerD + thick, powerZ - thick * 3]);
                translate([thick * 2, D - thick * 2 - powerD + thick, 0])
                    cube([videoX - thick * 2, powerD + thick, powerZ - thick]);
                translate([thick + 5, D - thick * 2 - powerD + 10, powerZ - thick])
                    cube([videoX - (thick + 5), powerD - 20, thick]);
            }
            translate([thick, 0, 0])
                rotate([0, 90, 0])
                    linear_extrude(videoX - thick)
                        polygon([[-powerZ + thick, D - thick * 2 - 10],
                                [-powerZ + thick + (thick * 2 + 10), D],
                                [-powerZ + thick, D]]);
            // floor / roof enforcement
            for (z = [0, H - 6])
                translate([thick + 0.2, panelHoleY + panelHoleInterval * 2 + 2, z])
                    cube([W - (thick + 0.2) * 2, 4, 6]);
            // power button
            translate([thick + 0.2, panelHoleY + panelHoleInterval * 3 + 4, H - thick]) {
                difference() {
                    translate([0, -thick, -9 - thick])
                        cube([9 + thick, 9 + thick * 2, 9 + thick]);
                    translate([0, 0, -9])
                        cube([9, 9, 9]);
                    translate([0, 4.5, -2])
                        cube([11, 6.5, 2]);
                }
            }
        }
        // mb backplate
        translate([3, 0, thick])
            cube([mbW, R, mbBackplateH]);
        // HDMI slit
        translate([videoX + 4, 0, 80])
            cube([14, thick, H - 80 - R]);
        // power cord
        translate([3 + mbW, 0, thick])
            cube([8, R, 3]);
        // power bottom
        translate([16, D - thick * 2 - powerD + thick, 0])
            cube([videoX - 36, powerD - thick - R, thick]);
        translate([16, rearD + 2, thick])
            cube([videoX - 36, 10, powerZ - thick * 2]);
        // video card screw holes
        for (z = [7, H - 7])
            for (i = [0:8])
                translate([videoX, R + (D - R * 2) / 8 * i, z])
                    rotate([0, 90, 0])
                        nabeneji_hole();
        for (y = [7, D - 7])
            for (i = [0:4])
                translate([videoX, y, R + (H - R * 2) / 4 * i])
                    rotate([0, 90, 0])
                        nabeneji_hole();
        // rear-front screw
        for (z = [20, H - 40])
            translate([videoX - 5, rearD + 2, z])
                rotate([90, 0, 0])
                    saraneji_hole();
        // power screw holes
        for (x = [thick + 6, thick + powerW - 6]) {
            translate([x, D - thick * 2 - powerD + 6, powerZ])
                nabeneji_hole();
            translate([x, D - thick * 2 - powerD + 6, 0])
                cylinder(r = 4, h = powerZ - thick, $fn = 32);
        }
    }
    // mb screws
    difference() {
        translate([mbScrewX, mbScrew1Y - 4, 0])
            cube([videoX - mbScrewX, 8, mbScrew1Z + 4]);
        translate([mbScrewX, mbScrew1Y, mbScrew1Z])
            rotate([0, -90, 0])
                nabeneji_hole();
    }
    difference() {
        translate([mbScrewX, mbScrew2Y - 4, 0])
            cube([videoX - mbScrewX, 8, mbScrew2Z + 4]);
        translate([mbScrewX, mbScrew2Y, mbScrew2Z])
            rotate([0, -90, 0])
                nabeneji_hole();
    }
    difference() {
        translate([mbScrewX, mbScrew3Y - 4, mbScrew3Z - 4])
            cube([videoX - mbScrewX, 8, H - (mbScrew3Z - 4)]);
        translate([mbScrewX, mbScrew3Y, mbScrew3Z])
            rotate([0, -90, 0])
                nabeneji_hole();
    }
    difference() {
        translate([mbScrewX, mbScrew4Y - 4, mbScrew4Z - 4])
            cube([videoX - mbScrewX, 8, H - (mbScrew4Z - 4)]);
        translate([mbScrewX, mbScrew4Y, mbScrew4Z])
            rotate([0, -90, 0])
                nabeneji_hole();
    }
    // panel holes
    for (i = [0:3]) {
        translate([0, panelHoleY + panelHoleInterval * i, 0])
            panel_hole();
        translate([0, panelHoleY + panelHoleInterval * i, H])
            rotate([180, 0, 0])
                panel_hole();
        translate([W, panelHoleY + panelHoleInterval * i, 0])
            rotate([0, 0, 180])
                panel_hole();
        translate([W, panelHoleY + panelHoleInterval * i, H])
            rotate([180, 0, 180])
                panel_hole();
    }
}

module saraneji_hole () {
    union() {
        translate([0, 0, -3.7])
            cylinder(r1 = 0, r2 = 3.7, h = 3.7, $fn = 32);
        translate([0, 0, -11.7])
            cylinder(r = 1.3, h = 11.7, $fn = 16);
    }
}

module nabeneji_hole() {
    translate([0, 0, -10])
        cylinder(r = 1.3, h = 10, $fn = 16);
}

module panel_hole() {
    difference() {
        union() {
            translate([0, -4, 0])
                cube([16, 8, thick + 4]);
            translate([0, 0, thick + 4])
                rotate([0, 90, 0])
                    cylinder(r = 4, h = 16, $fn = 32);
        }
        translate([0, -4, 0])
            cube([thick + 0.2, 8, thick + 8]);
        translate([0, 0, thick + 4])
            rotate([0, -90, 0])
                saraneji_hole();
        translate([0, 0, 6])
            rotate([-90, 0, 0])
                translate([0, 0, -4])
                    linear_extrude(8)
                        polygon([[11, -4], [17, 6], [17, -4]]);
    }
}

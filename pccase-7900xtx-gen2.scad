R = 20;
thick = 2;
mbY = 10;
mbW = 52;
mbD = 174.5;
mbH = 174;
mbBackplateH = 164;
mbScrewX = thick + 47; /* does this reflect the side change? */
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
            cube([10, D, 10]);
        translate([videoX - 10, rearD, 0])
            cube([10, D - rearD, 30]);
        // rear split
        translate([videoX - 10, 0, 0])
            cube([10, 20, H]);
        // top split
        translate([videoX - 10, 0, H - 10])
            cube([10, D, 10]);
        translate([videoX - thick * 2, 0, H - 30])
            cube([thick * 2, rearD, 30]);
        // mid split
        translate([videoX - 10, rearD - 2, 0])
            cube([10, 12, H]);
        // front split
        translate([thick + powerW, D - 10, 0])
            cube([videoX - (thick + powerW), 10, H]);
        translate([videoX - thick * 2, D - 20, 0])
            cube([thick * 2, 20, H]);
        // mb roof
        translate([0, 0, 0])
            cube([thick, mbY, H]);
        // power
        difference() {
            translate([thick, D - thick - powerD, 0])
                cube([videoX - thick, powerD, powerZ]);
            translate([thick, D - thick - powerD + thick, 0])
                cube([videoX - thick, powerD, powerZ - thick]);
        }
        translate([thick, D - thick - 5, powerZ + powerH])
            cube([videoX - thick, 5, thick]);
        // floor / roof enforcement
        for (z = [0, H - 6])
            translate([thick + 0.2, panelHoleY + panelHoleInterval * 2 + 2, z])
                cube([W - (thick + 0.2) * 2, 4, 6]);
    }
    // mb backplate
    translate([3, 0, thick])
        cube([mbW, R, mbBackplateH]);
    // power bottom
    translate([16, D - thick - powerD + thick, 0])
        cube([videoX - 26, powerD - thick - R, thick]);
    translate([16, D - thick - powerD, thick])
        cube([videoX - 26, thick, powerZ - thick * 2]);
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

module sarakineji_hole () {
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
                sarakineji_hole();
        translate([0, 0, 6])
            rotate([-90, 0, 0])
                translate([0, 0, -4])
                    linear_extrude(8)
                        polygon([[11, -4], [17, 6], [17, -4]]);
    }
}

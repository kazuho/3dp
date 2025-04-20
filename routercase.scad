mbW = 141;
mbD = 148;
mbH = 2;
mbHoleO = 5.5;
mbHoleR = 2.5;
R = 5;

ethW = 36;
ethD = 38;
rj45W = 18;
rj45D = 29;
rj45H = 11;

powerX = 20;
powerZ = -3;
powerW = 12;
powerH = 10;
backConnectorW = 108; // from powerX

thick = 2;
screwH = 10;
screwR = 1.5;

mbMarginBelow = 10;
mbMarginAbove = 40;
mbMarginAbove2 = 4;

// body
if (0) {
    difference () {
        hull () {
            Z = -(thick + rj45H + mbMarginBelow) + R;
            translate([R - thick, -thick, Z])
                rotate([-90, 0, 0])
                    cylinder(r = R, h = mbD + thick * 2, $fn = 16);
            translate([mbW + thick - R, -thick, Z])
                rotate([-90, 0, 0])
                    cylinder(r = R, h = mbD + thick * 2, $fn = 16);
            translate([-thick, -thick, 0])
                cube([mbW + thick * 2, mbD + thick * 2, thick + mbMarginAbove]);
        }
        translate([0, 0, -rj45H - mbMarginBelow])
            cube([mbW, mbD - thick, rj45H + mbMarginBelow]);
        translate([0, 0, 0])
            cube([mbW, mbD, thick + mbMarginAbove]);
        translate([0, -thick, thick])
            cube([mbW, mbD + thick * 2, mbMarginAbove]);
        // facade
        difference () {
            hull () {
                Z = -(thick + rj45H + mbMarginBelow) + R;
                translate([R - thick, mbD, Z])
                    rotate([-90, 0, 0])
                        cylinder(r = R - thick, h = thick, $fn = 16);
                translate([mbW + thick - R, mbD, Z])
                    rotate([-90, 0, 0])
                        cylinder(r = R - thick, h = thick, $fn = 16);
                translate([0, mbD, 0])
                    cube([mbW, thick, thick + mbMarginAbove]);
            }
            for (i = [0:1]) {
                translate([thick, mbD + thick, -8 - 12 * i + thick])
                    rotate([0, 90, 0])
                        linear_extrude(mbW - thick * 2)
                            polygon([[0, -2], [-8, -2], [-7, 0], [-1, 0]]);
            }
        }
        // bottom holes
        for (x = [2:12]) {
            translate([x * 10, 40, -(thick + rj45H + mbMarginBelow)]) {
                hull () {
                    cylinder(r = 3, h = thick, $fn = 32);
                    translate([0, 80, 0])
                        cylinder(r = 3, h = thick, $fn = 32);
                }
            }
        }
        // back holes
        translate([powerX, -thick, powerZ])
            cube([powerW, thick, powerH]);
        // ethernet
        for (x = [mbW * .5 - ethW, mbW * .5]) {
            translate([x + (ethW - rj45W) * .5, -thick, -mbMarginBelow - thick - rj45H])
                cube([rj45W, rj45D + thick, rj45H]);
        }
        // screw holes
        translate([-thick, 5, thick + mbMarginAbove - 5])
            rotate([0, -90, 0])
                sarakineji_hole();
        translate([-thick, mbD - 5, thick + mbMarginAbove - 5])
            rotate([0, -90, 0])
                sarakineji_hole();
        translate([mbW + thick, 5, thick + mbMarginAbove - 5])
            rotate([0, 90, 0])
                sarakineji_hole();
        translate([mbW + thick, mbD - 5, thick + mbMarginAbove - 5])
            rotate([0, 90, 0])
                sarakineji_hole();
    }

    // ethernet mount
    for (x = [mbW * .5 - ethW, mbW * .5]) {
        difference () {
            translate([x, 0, -mbMarginBelow - rj45H])
                cube([(ethW - rj45W) * .5, 15, rj45H - thick]);
            translate([x + 5.5, 5, -mbMarginBelow - screwH])
                cylinder(r = screwR, h = screwH, $fn = 8);
        }
        difference () {
            translate([x + (ethW + rj45W) * .5, 0, -mbMarginBelow - rj45H])
                cube([(ethW - rj45W) * .5, 15, rj45H - thick]);
            translate([x + ethW - 5.5, 5, -mbMarginBelow - screwH])
                cylinder(r = screwR, h = screwH, $fn = 8);
        }
    }

    // mb mount
    for (x = [mbHoleO, mbW - mbHoleO]) {
        for (y = [mbHoleO, mbD - mbHoleO]) {
            H = rj45H + mbMarginBelow;
            difference () {
                translate([x - mbHoleO, y - mbHoleO, -H])
                    cube([mbHoleO * 2, mbHoleO * 2, H]);
                translate([x, y, -screwH])
                    cylinder(r = screwR, h = screwH, $fn = 8);
            }
        }
    }
}

// rid
if (1) {
    translate([0, 0, 60]) {
        difference () {
            hull () {
                translate([-thick, -thick, thick])
                    cube([mbW + thick * 2, mbD + thick * 2, thick]);
                Z = thick + mbMarginAbove + mbMarginAbove2 + thick - R;
                translate([R - thick, -thick, Z])
                    rotate([-90, 0, 0])
                        cylinder(r = R, h = mbD + thick * 2, $fn = 16);
                translate([mbW + thick - R, -thick, Z])
                    rotate([-90, 0, 0])
                        cylinder(r = R, h = mbD + thick * 2, $fn = 16);
            }
            translate([-thick, thick, thick])
                cube([mbW + thick * 2, mbD - thick * 2, mbMarginAbove - 10]);
            difference() {
                translate([5, thick, thick + mbMarginAbove - 10])
                    cube([mbW - 10, mbD - thick * 2, 10 + mbMarginAbove2]);
                translate([76 + 32 - thick, 0, 32 + thick])
                    cube([8.5 + thick * 2, 9.5 + thick, mbMarginAbove + mbMarginAbove2 - 32]);
            }
            // facade
            difference () {
                hull () {
                    translate([0, mbD, thick])
                        cube([mbW, thick, thick]);
                    Z = thick + mbMarginAbove + mbMarginAbove2 + thick - R;
                    translate([R - thick, mbD, Z])
                        rotate([-90, 0, 0])
                            cylinder(r = R - thick, h = thick, $fn = 16);
                    translate([mbW + thick - R, mbD, Z])
                        rotate([-90, 0, 0])
                            cylinder(r = R - thick, h = thick, $fn = 16);
                }
                for (i = [0:3]) {
                    translate([thick, mbD + thick, 12 * i + 4 + thick])
                        rotate([0, 90, 0])
                            linear_extrude(mbW - thick * 2)
                                polygon([[0, -2], [-8, -2], [-7, 0], [-1, 0]]);
                }
            }
            // sides
            translate([-thick, -thick, thick])
                cube([thick + .2, mbD + thick * 2, mbMarginAbove]);
            translate([mbW - .2, -thick, thick])
                cube([thick + .2, mbD + thick * 2, mbMarginAbove]);
            // top holes
            for (x = [2:12]) {
                translate([x * 10, 20, thick + mbMarginAbove + mbMarginAbove2]) {
                    hull () {
                        cylinder(r = 3, h = thick, $fn = 32);
                        translate([0, 100, 0])
                            cylinder(r = 3, h = thick, $fn = 32);
                    }
                }
            }
            // back connectors
            translate([powerX, -thick, thick])
                cube([53, thick * 2, 7]);
            translate([76, -thick, thick])
                cube([32, thick * 2, 13]);
            translate([76 + 32, -thick, thick])
                cube([21, thick * 2, 32]);
            // power button
            translate([76 + 32, -thick, 32 + thick]) {
                translate([0, thick, 0])
                    cube([8.5, 9.5, 8]);
                translate([2, 0, 0])
                    cube([4.5, thick, 6.5]);
                translate([0, thick + 9.5, 0])
                    cube([3, thick, 8]);
            }
            // front connectors
            translate([73, mbD - thick, thick])
                cube([56, thick * 2, 8]);
            // front slit
            for (x = [1:9])
                translate([x * 7, mbD - thick, thick])
                    cube([5, thick, 30]);
            // rear slit
            for (x = [2:6]) {
                hull () {
                    translate([x * 10, -thick, thick + 15])
                        rotate([-90, 0, 0])
                            cylinder(r = 3, h = thick * 2, $fn = 32);
                    translate([x * 10, -thick, mbMarginAbove + mbMarginAbove2 - 10])
                        rotate([-90, 0, 0])
                            cylinder(r = 3, h = thick * 2, $fn = 32);
                }
            }
            // screw holes
            translate([0, 5, thick + mbMarginAbove - 5])
                rotate([0, 90, 0])
                    cylinder(r = screwR, h = mbW, $fn = 8);
            translate([0, mbD - 5, thick + mbMarginAbove - 5])
                rotate([0, 90, 0])
                    cylinder(r = screwR, h = mbW, $fn = 8);
        }
    }
}

module sarakineji_hole () {
    translate([0, 0, -3.7])
        cylinder(r1 = 0, r2 = 3.7, h = 3.7, $fn = 32);
}

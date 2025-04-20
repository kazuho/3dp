thick = 2;
Rfront = 10;
Rrear = 10;
W = 180;
D = 250;
H = 203;
videoZ = 164;
powerW = 87.5;
powerD = 141.5;
powerH = 151;
mbX = thick + powerW + thick + 25;
mbZ = thick * 2;
mbW = 49;
mbD = 174;
mbBoardX = mbX + 42;
mbBoardZ = mbZ + thick;
mbBoardW = 2;
powerRidW = 26;
powerRidRearW = 45;
mbRidW = 34;
screwH = 10;
screwR = 1.5;

mcBit = (W - Rfront * 2) / 8;

if (1) difference() {
    union() {
        difference() {
            hull() {
                for (x = [Rrear, W - Rrear])
                    translate([x, Rrear, 0])
                        cylinder(r = Rrear, h = H, $fn = 64);
                for (x = [Rfront, W - Rfront])
                    translate([x, D - Rfront, 0])
                        cylinder(r = Rfront, h = H, $fn = 64);
            }
            difference() {
                hull() {
                    for (x = [Rrear, W - Rrear])
                        translate([x, Rrear, thick])
                            cylinder(r = Rrear - thick, h = H, $fn = 64);
                    for (x = [Rfront, W - Rfront])
                        translate([x, D - Rfront - thick, thick])
                            cylinder(r = Rfront - thick, h = H, $fn = 64);
                }
                cube([thick + powerW, Rrear, thick + powerH - 5 + thick]);
                cube([Rrear, Rrear, H - thick - 0.5]);
                translate([0, D - Rfront, 0])
                    cube([Rfront, Rfront, H - thick - 0.5]);
                translate([W - Rfront, D - Rfront, 0])
                    cube([Rfront, Rfront, H - thick - 0.5]);
            }
            hull() {
                for (x = [Rfront, W - Rfront])
                    translate([x, D - Rfront, H - thick - 0.25])
                        cylinder(r = Rfront - thick, h = thick + 0.5, $fn = 64);
            }
            // power bottom
            translate([thick + 10, Rrear + 10, 0])
                cube([powerW - 20 + thick, powerD - 20, thick]);
        }
        // mb
        translate([mbX, 0, 0])
            cube([mbW, thick * 3, mbZ]);
        difference() {
            translate([mbBoardX - thick * 2, mbD - thick * 3, 0])
                cube([thick * 5, thick * 5, mbBoardZ + thick * 3]);
            translate([mbBoardX, mbD - thick * 3, mbBoardZ])
                cube([thick, thick * 3, thick * 3]);
        }
        translate([mbBoardX - thick * 2, mbD - 170, 0])
            cube([thick * 5, thick * 3, mbBoardZ]);
        // bottom support
        translate([thick, thick + mbD, thick])
            cube([W - thick * 2, thick * 3, thick * 3]);
        translate([thick + powerW, thick + powerD, thick])
            cube([thick * 3, D - thick - powerD - 10, thick * 3]);
        // mb-side support
        translate([W - thick * 3, 40, thick])
            cube([thick * 2, thick, H - thick - 10]);
        translate([0, 35, 0])
            rotate([-90, 0, 0])
                linear_extrude(10)
                    polygon([[W - 10 - thick, -H + thick + 0.5],
                             [W - 10 - thick, -H + thick + 15.5],
                             [W - thick, -H + thick + 25.5],
                             [W - thick, -H + thick + 0.5]]);
        translate([W - thick * 3, 140, thick])
            cube([thick * 2, thick, H - thick - 10]);
        translate([0, 135, 0])
            rotate([-90, 0, 0])
                linear_extrude(10)
                    polygon([[W - 10 - thick, -H + thick + 0.5],
                             [W - 10 - thick, -H + thick + 15.5],
                             [W - thick, -H + thick + 25.5],
                             [W - thick, -H + thick + 0.5]]);
        translate([0, Rrear, 0])
            rotate([-90, 0, 0])
                linear_extrude(D - Rrear - Rfront)
                    polygon([[W - thick * 3, -H * .6], [W - thick, -H * .6], [W - thick, -H * .6 + thick * 2]]);
        // intake
        translate([Rfront, D - 10, 0])
            cube([W - Rfront * 2, 10, 10 + thick]);
        translate([Rfront, D - 10 - thick * 2, thick])
            cube([W - Rfront * 2, thick * 2, thick * 2]);
        // video card support
        translate([W / 2 - thick * 2, D - 15, 0])
            cube([thick * 4, 15, videoZ]);
        // power
        translate([thick + powerW, thick, thick]) {
            cube([thick * 3, Rrear - thick + 20, videoZ - thick]);
            cube([thick, Rrear - thick + powerD, 30]);
        }
        translate([thick, Rrear + powerD, thick])
            cube([10, thick, H - thick - 10]);
        translate([0, Rrear + powerD, 0])
            rotate([-90, 0, 0])
                linear_extrude(10)
                    polygon([[thick + 10, -H + thick + 0.5],
                            [thick + 10, -H + thick + 15.5],
                            [thick, -H + thick + 25.5],
                            [thick, -H + thick + 0.5]]);
        difference() {
            translate([thick + powerW - 15, Rrear + powerD - 15, thick])
                cube([15 + thick * 3, 15 + thick * 3, 30]);
            translate([thick, Rrear, thick])
                cube([powerW, powerD, videoZ - thick]);
        }
    }
    // mb
    translate([mbX, 1, mbZ])
        cube([mbW, thick, H]);
    translate([mbX + 1, 0, mbZ])
        cube([mbW - 3, thick, H]);
    translate([mbX + 1, 1, 0.2])
        cube([42, 1, 10]);
    // power
    translate([thick + 10, 0, thick + 5])
        cube([powerW - 15, Rrear, powerH - 5 - (powerW - 15) / 2 - thick - 5]);
    translate([thick + 10 + (powerW - 15) / 2, 0, powerH - 5 - (powerW - 15) / 2])
        rotate([-90, 0, 0])
            cylinder(r = (powerW - 15) / 2, h = Rrear, $fn = 128);
    // video
    translate([Rrear, 0, videoZ])
        cube([W - (Rrear + thick), Rrear, H]);
    // intake
    translate([0, D, 0]) {
        rotate([90, 0, 0]) {
            hull() {
                translate([Rfront + 15, 0, 0])
                    cylinder(r = 10, h = 10, $fn = 64);
                translate([W - Rfront - 15, 0, 0])
                    cylinder(r = 10, h = 10, $fn = 64);
            }
        }
    }
    // logo
    mcBit(1, 4, 2, 2);
    mcBit(5, 4, 2, 2);
    mcBit(2, 0, 1, 3);
    mcBit(5, 0, 1, 3);
    mcBit(3, 1, 1, 3);
    mcBit(4, 1, 1, 3);
    // screw holes
    all_screw_holes();
}

// rid
if (1) translate([-300, 0, 0]) {
    difference() {
        union() {
            hull() {
                for (x = [Rrear, W - Rrear])
                    translate([x, Rrear, H - thick])
                        cylinder(r = Rrear - thick - 0.5, h = thick, $fn = 64);
                for (x = [Rfront, W - Rfront])
                    translate([x, D - Rfront, H - thick])
                        cylinder(r = Rfront - thick - 0.5, h = thick, $fn = 64);
            }
            for (y = [Rrear + 0.5, D / 3 - thick, D / 3 * 2 - thick, D - Rfront - 0.5 - thick])
                translate([thick + 0.5, y, H - 5])
                    cube([W - (thick + 0.5) * 2, thick, 5]);
            for (x = [powerRidW - thick, W - mbRidW])
                translate([x, thick + 0.5, H - 5])
                    cube([thick, D - thick * 3 - 1, 5]);
        }
        translate([powerRidW, 0, 0])
            cube([W - (powerRidW + mbRidW), D, H]);
        all_screw_holes();
        // mbRidRear
        translate([W - mbRidW, 0, 0])
            cube([mbRidW, thick * 2, H]);
        // power button
        translate([(W - mbRidW) + mbRidW * .5 - 4.5 - thick, D - mbRidW * .75 - 4.5 - thick, H - thick])
            cube([9 + thick * 2, 9 + thick * 2, thick]);
    }
    // powerRidRear
    translate([Rrear + 0.5, 0, videoZ + 0.5])
        cube([powerRidRearW - (Rrear + 0.5), thick + 0.5, H - (videoZ + 0.5)]);
    // mb support
    difference() {
        translate([mbBoardX - thick * 2, mbD - thick * 2 + .5, mbZ + 171 - thick * 2])
            cube([thick * 5, thick * 4, H - (mbZ + 171 - thick * 2)]);
        translate([mbBoardX, mbD - thick * 2 + .5, mbZ + 171 - thick * 2])
            cube([thick, thick * 2, thick * 2]);
    }
    difference() {
        translate([mbBoardX - thick * 2, 13, mbZ + 171 - thick * 2])
            cube([thick * 5, 5, H - (mbZ + 171 - thick * 2)]);
        translate([mbBoardX, 13, mbZ + 171 - thick * 2])
            cube([thick, 5, thick * 2]);
    }
    // power button
    translate([(W - mbRidW) + mbRidW * .5, D - mbRidW * .75, H - thick]) {
        difference() {
            translate([-4.5 - thick * 2, -4.5 - thick * 2, -10 - thick])
                cube([9 + thick * 4, 9 + thick * 4, 10 + thick]);
            translate([-4.5, -4.5, -10])
                cube([9, 9, 10]);
            translate([-4.5, -4.5, -10 - thick])
                cube([4, 6, thick]);
        }
    }
}

// minecraft panels
if (1) translate([300, 0, 0]) {
    linear_extrude(thick - 0.5)
        polygon([[0, 0], [0, mcBit * 2 - 1], [mcBit * 2 - 1, mcBit * 2 - 1], [mcBit * 2 - 1, 0]]);
    translate([mcBit - 0.5, mcBit - 0.5, 0])
        cylinder(r = 2.5, h = thick * 2 - 0.5, $fn = 32);
    translate([mcBit - 0.5, mcBit - 0.5, 0])
        linear_extrude(height = 10, convexity = 10, twist = 2000)
            translate([0.5, 0])
                circle(r = 2, $fn = 32);
}

if (1) translate([300, 100, 0]) {
    linear_extrude(thick - 0.5)
        polygon([[0.5, 0.5], [0, mcBit * 3 - 0.5], [mcBit + 0.5, mcBit * 3 - 0.5],
                 [mcBit + 0.5, mcBit * 4 - 0.5], [mcBit * 3 - 0.5, mcBit * 4 - 0.5], [mcBit * 3 - 0.5, mcBit * 3 - 0.5],
                 [mcBit * 4 - 0.5, mcBit * 3 - 0.5], [mcBit * 4 - 0.5, 0.5], [mcBit * 3 + 0.5, 0.5],
                 [mcBit * 3 + 0.5, mcBit + 0.5], [mcBit - 0.5, mcBit + 0.5], [mcBit - 0.5, 0.5]]);
    for (x = [mcBit * 0.5, mcBit * 3.5]) {
        translate([x, mcBit * 1.5, 0])
            cylinder(r = 2.5, h = thick * 2 - 0.5, $fn = 32);
        translate([x, mcBit * 1.5, 0])
            linear_extrude(height = 10, convexity = 10, twist = 2000)
                translate([0.5, 0])
                    circle(r = 2, $fn = 32);
    }
}

// minecraft panel bolt
if (1) translate([300, 200, 0]) {
    difference() {
        cylinder(r = 10, h = 5, $fn = 6);
        linear_extrude(height = 10, convexity = 10, twist = 2000)
            translate([0.5, 0])
                circle(r = 2.5, $fn = 32);
    }
}

if (1) translate([300, 300, 0]) {
    difference() {
        cube([9 + thick * 2 - 0.5, 9 + thick * 2 - 0.5, thick - 0.5]);
        translate([1.5 + thick - 0.25, 1.5 + thick - 0.25, 0])
            cube([6, 6, thick - 0.5]);
    }
}
module all_screw_holes() {
    // screw holes
    translate([Rrear / 2 + thick, Rrear / 2 + thick, H])
        sarakineji_hole();
    translate([Rrear / 2 + thick, Rrear + powerD + 5, H])
        sarakineji_hole();
    translate([Rfront / 2 + thick, D - thick - Rfront / 2, H])
        sarakineji_hole();
    translate([W - Rrear / 2 - thick, 40, H])
        sarakineji_hole();
    translate([W - Rrear / 2 - thick, 140, H])
        sarakineji_hole();
    translate([W - Rfront / 2 - thick, D - thick - Rfront / 2, H])
        sarakineji_hole();
    for (x = [powerRidW - 10, W - mbRidW + 10])
        for (y = [50, D / 2, D - 50])
            translate([x, y, H - thick])
                rotate([180, 0, 0])
                    sarakineji_hole();
}

module sarakineji_hole () {
    union() {
        translate([0, 0, -3.7])
            cylinder(r1 = 0, r2 = 3.7, h = 3.7, $fn = 32);
        translate([0, 0, -11.7])
            cylinder(r = 1.7, h = 10, $fn = 16);
    }
}

module mcBit(x, z, w, h) {
    translate([(W - mcBit * 8) / 2 + mcBit * x, D, H - mcBit * 8 + mcBit * z]) {
        rotate([0, 90, 0])
            linear_extrude(mcBit * w)
                polygon([[0, 0], [0, -thick], [-mcBit * h + thick / 4, -thick], [-mcBit * h - thick / 4, 0]]);
        translate([mcBit * w / 2, 0, mcBit * h / 2])
            rotate([90, 0, 0])
                cylinder(r = 3, h = 10, $fn = 32);
    }
}

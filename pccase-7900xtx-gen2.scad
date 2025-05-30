R = 20;
thick = 2;
mbY = 10;
mbW = 52;
mbD = 174.5;
mbH = 174;
mbBackplateH = 164;
mbScrewX = thick + 45;
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
        translate([videoX - thick * 2, D - thick - powerD - 10, 0])
            cube([thick * 2, powerD + 10 + thick, 30]);
        // rear split
        translate([videoX - 10, 0, 0])
            cube([10, 20, H]);
        // top split
        translate([videoX - 10, 0, H - 10])
            cube([10, D, 10]);
        translate([videoX - thick * 2, 0, H - 30])
            cube([thick * 2, D - thick - powerD - 10, 30]);
        // mid split
        translate([videoX - 10, D - thick - powerD - 20, 0])
            cube([10, 10, H]);
        // front split
        translate([videoX - 10, D - 10, 0])
            cube([10, 10, H]);
        translate([videoX - thick * 2, D - 20, 0])
            cube([thick * 2, 20, H]);
    }
}

module sarakineji_hole () {
    union() {
        translate([0, 0, -3.7])
            cylinder(r1 = 0, r2 = 3.7, h = 3.7, $fn = 32);
        translate([0, 0, -11.7])
            cylinder(r = 1.3, h = 11.7, $fn = 16);
    }
}

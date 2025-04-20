W = 9;
H = 8 * 2;
R = 1.35;
thick = 1.2;

difference() {
    hull() {
        for (x = [R + thick, W + thick * 2 - (R + thick)])
            for (z = [R + thick, H - (R + thick)])
                translate([x, R + thick, z])
                    sphere(r = R + thick, h = H, $fn = 32);
    }
    hull() {
        translate([R + thick, R + thick, 0])
            cylinder(r = R, h = H, $fn = 32);
        translate([W + thick * 2 - (R + thick), R + thick, 0])
            cylinder(r = R, h = H, $fn = 32);
    }
}

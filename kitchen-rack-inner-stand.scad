meshD = 191;
meshH  = 5.2;
thick = 3;
R = thick;
W = 40;
D = meshD + thick * 2;
H = 250;

difference() {
    hull() {
        for (y = [thick, D - thick])
            for (z = [thick, H - thick])
                translate([0, y, z])
                    rotate([0, 90, 0])
                        cylinder(r = thick, h = W, $fn = 32);
    }
    // mesh slit
    translate([thick, thick, H - thick - meshH])
        cube([W, meshD, meshH]);
    // 
    translate([10, 0, 0])
        cube([W, D, H - thick * 2 - meshH]);
    translate([0, 10, 10])
        cube([10, D - 20, H - thick * 2 - meshH - 20]);
    translate([thick, thick, thick])
        cube([10 - thick, D - thick * 2, H - thick * 3 - meshH]);
}

thick = 1.6;
R = 27 + thick;
H = 120;
suckerRin = 4.5;
suckerRout = 9;

difference() {
    hull() {
        translate([R, R, R])
            sphere(r = R, $fn = 64);
        translate([R, R, H - 1])
            cylinder(r = R, h = 1, $fn = 64);
    }
    translate([R, R, R])
        cylinder(r = R - thick, h = H - R, $fn = 64);
    translate([R, R, R])
        sphere(r = R - thick, $fn = 64);
    cube([R * 0.14, R * 2, H]);
    cube([R * 2, R * 2, R * 0.17 + thick]);
    
    translate([R * 2, R, H - suckerRout * 1.5])
        rotate([0, -90, 0])
            cylinder(r = suckerRin, h = R, $fn = 32);
    translate([R, R - suckerRin + 1, H - suckerRout * 3])
        cube([R, suckerRin * 2 - 2, suckerRout * 1.5]);
    translate([R * 2, R, H - suckerRout * 3])
        rotate([-0, -90, 0])
            cylinder(r = suckerRout, h = R, $fn = 32);
    difference() {
        translate([0, 0, H - R * .86])
            cube([R * .86, R * 2, H]);
        translate([R, 0, H - R * .86])
            rotate([-90, 0, 0])
                cylinder(r = R * .86, h = R * 2, $fn = 64);
    }
}

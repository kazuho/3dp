R = 5.5;
L = 30;
thick = 1.2;

difference() {
    union() {
        sphere(r = R + thick, $fn = 64);
        cylinder(r = R + thick, h = L, $fn = 64);
    }
    sphere(r = R, $fn = 64);
    cylinder(r = R, h = L, $fn = 64);
}
translate([0, 0, L - 0.5])
    rotate_extrude(angle = 360, $fn = 64)
        translate([R, 0])
                circle(r = 0.5, $fn = 32);

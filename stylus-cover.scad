R = 5.0;
L = 30;
thick = 1.2;

difference() {
    union() {
        sphere(r = R + thick, $fn = 64);
        cylinder(r = R + thick, h = L, $fn = 64);
    }
    sphere(r = R, $fn = 64);
    difference() {
        cylinder(r = R, h = L, $fn = 64);
        translate([-R, -R, L - 1])
            cube([0.5, 2 * R, 1]);
    }
}

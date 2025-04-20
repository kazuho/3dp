I = 25;
R = 2;
W = R * sqrt(3) / 2;
thick = 6.5;

rotate([-90, 30, 0])
    cylinder(r = R, h = thick / 2, $fn = 6);
translate([0, thick / 2, thick / 2 + R])
    rotate([0, 90, 0])
        rotate_extrude(angle = 90)
            translate([thick / 2 + R, 0])
                circle(r = R, $fn = 6);
translate([0, thick + R, thick / 2 + R])
    rotate([0, 0, 30])
        cylinder(r = R, h = 10, $fn = 6);

translate([0, 0, -I])
    rotate([-90, 30, 0])
        cylinder(r = R, h = thick + R * 2, $fn = 6);

translate([-W, 0, 0])
    rotate([0, 90, 0])
        linear_extrude(W * 2)
            polygon([[I + 5, 0], [-3, 0], [-3, -100], [0, -100]]);
translate([-W, -100, 0])
    cube([W * 2, 5, 5]);
translate([-W, -5, 0])
    cube([W * 2, 5, 5]);

/*
I = 25;
thick = 2;
W = I * 6 + 5 * 2;
D = 100;

difference() {
    hull() {
        for (x = [thick, W - thick])
            for (y = [thick, D - thick])
                translate([x, y, thick])
                    sphere(r = thick, $fn = 16);
    }
    translate([thick, thick, thick / 2])
        cube([W - thick * 2, D - thick * 2, thick * 2]);
    for (i = [0:6])
        for (y = [0, D - 5.5])
            translate([i * I + 5 - 1.9, y, 0])
                cube([3.8, 5.5, 2.5]);
}
*/
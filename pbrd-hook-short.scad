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

difference() {
    translate([0, -R / 2, -I])
        rotate([0, 0, 30])
            cylinder(r = R, h = I + R, $fn = 6);
    translate([-50, 0, -I])
        cube([100, 100, 100]);
    translate([-R, 0, 0])
        rotate([0, 90, 0])
            linear_extrude(R * 2)
                polygon([[0, -1.5 * R], [-R, -1.5 * R], [-R, 0]]);
}

translate([0, 0, -I + 10 + R])
    rotate([-90, 0, -90])
        rotate_extrude(angle = 90)
            translate([10 + R, 0])
                circle(r = R, $fn = 6);
translate([0, -10 - R, -I + 10 + R])
    rotate([0, 0, 30])
        sphere(r = R, $fn = 6);

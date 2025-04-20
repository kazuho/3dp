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

translate([-W, -5, -I - 5])
    cube([W * 2, 5, I + 10]);

translate([-W, -100, -3])
    cube([W * 2, 100, 8]);
translate([W, -100, 10])
    rotate([180, 90, 0])
        rotate_extrude(angle = 90)
            translate([5, 0])
                square([8, W * 2]);

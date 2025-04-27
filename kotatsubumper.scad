R = 25;
inR = 9.5;

difference() {
    sphere(r = R, $fn = 128);
    translate([-R, -R, R * .75])
        cube([R * 2, R * 2, R]);
    translate([0, 0, -R])
        cylinder(r = inR, h = R * 2, $fn = 128);
    translate([0, -inR + 1, -R])
        cube([R, (inR - 1) * 2, R * 2]);
}

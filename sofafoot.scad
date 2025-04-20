W = 40;
D = 40;
H = 5;
R = 2;
footR = 11;
thick = 1.2;

difference() {
    hull() {
        for (x = [R, W - R])
            for (y = [R, D - R])
                translate([x, y, 0])
                    cylinder(r = R, h = H, $fn = 16);
    }
    translate([W / 2, D / 2, thick])
        cylinder(r = footR, h = H, $fn = 32);
}
thick = 0.8;
W = 222;
D = 171;
H = 19;
R = 8;
latchW = 104;
latchD = 10;

difference() {
    union() {
        //cube([W, D, 1]);
        for (i = [1:5])
            translate([W / 6 * i - thick / 2, 0, 0])
                cube([thick, D, H]);
        for (i = [1:4])
            translate([0, (D - 10) / 5 * i - thick / 2, 0])
                cube([W, thick, H]);
    }
    translate([(W - latchW) / 2, D - latchD, 0])
        cube([latchW, latchD, H]);
}

difference() {
    hull() {
        for (x = [R, W - R])
            for (y = [R, D - R])
                translate([x, y, 0])
                    cylinder(r = R, h = H, $fn = 32);
    }
    hull() {
        for (x = [R, W - R])
            for (y = [R, D - R])
                translate([x, y, thick])
                    cylinder(r = R - thick, h = H - thick, $fn = 32);
    }
    translate([(W - latchW) / 2 - 1, D - latchD, 0])
        cube([latchW + 2, latchD, H]);
}

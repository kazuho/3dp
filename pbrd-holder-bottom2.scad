thick = 2;
spaceH = 122;
boardD = 6.5;

W = 15;
H = spaceH + 50;
D = H + 10 + boardD;

difference() {
    hull() {
        for (x = [0, W - 10]) {
            translate([x, 0, 0])
                sphere(r = 10, $fn = 32);
            translate([x, D, 0])
                sphere(r = 10, $fn = 32);
            translate([x, D, H - 10])
               sphere(r = 10, $fn = 32);
            translate([x, D - 10 - boardD, H - 10])
                sphere(r = 10, $fn = 32);
        }
    }
    translate([-200, -200, -100])
        cube([400, 400, 100]);
    translate([-200, D, -200])
        cube([400, 100, 400]);
    translate([-100, -200, -200])
        cube([100, 400, 400]);
    translate([0, D - 10 - boardD, spaceH])
        rotate([-3, 0, 0])
            cube([W, boardD, H - spaceH + 10]);
}

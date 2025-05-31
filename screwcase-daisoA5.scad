thick = 1.6;
W = 222;
D = 172;
H = 19;
latchW = 104;
latchD = 10;

difference() {
    union() {
        //cube([W, D, 1]);
        for (i = [1:7])
            translate([W / 8 * i - thick / 2, 0, 0])
                cube([thick, D, H]);
        for (i = [1:5])
            translate([0, (D - 15) / 6 * i - thick / 2, 0])
                cube([W, thick, H]);
    }
    translate([(W - latchW) / 2, D - latchD, 0])
        cube([latchW, latchD, H]);
}

thick = 2;
boardD = 6.5;

W = 60;
D = 10 + boardD + thick;
H = 10 + thick;

difference() {
    cube([W, D, H]);
    translate([0, thick, thick])
        cube([W, boardD, H - thick]);
}

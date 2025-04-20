thick = 2;
spaceH = 122;
boardD = 6.5;

W = 10;
D = 10 + boardD + 100;
H = spaceH + 50;

difference() {
    cube([W, D, H]);
    translate([0, 10, spaceH])
        cube([W, boardD, H - spaceH]);
    translate([thick, 10 + boardD + thick, thick])
        cube([W, D, H]);
    rotate([0, 90, 0])
        linear_extrude(thick)
            polygon([[-thick, D], [-H, D], [-H, 10 + boardD + thick]]);
}

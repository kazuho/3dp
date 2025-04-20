W = 450 - 9 * 2;
H = 150;
D = 5;
wingW = 18;
wingD = 2;
slitW = 9;
slitH = 18;
slitBottom = 88;
left = 0;

intersection() {
    union() {
        for (x = [0:floor(W/7) + 2]) {
            translate([x * 7, 0, 0])
                linear_extrude(H)
                    polygon([[-2, D], [D *.5 - 2, 0], [D * .5, 0], [0, D]]);
        }
        for (z = [0:floor(H / 20)]) {
            translate([0, 2, z * 20])
                cube([W, D - 2, 1]);
        }
    }
    if (left) {
        cube([W / 2 - 3.5, D, H]);
    } else {
        translate([W / 2 + 1.5, 0, 0])
            cube([W / 2 - 1.5, D, H]);        
    }
}
difference() {
    translate([left ? -wingW : W - 2, 0, 0])
        cube([wingW + 2, D, H]);
    translate([left ? -wingW : W, wingD, 0])
        cube([wingW, D, H]);
}

for (z = [89 /*, 197 */]) {
    translate([left ? -slitW : W, 0, z]) {
        rotate([0, 90, 0]) {
            linear_extrude(slitW) {
                polygon([[0, 0], [0, 9], [1, 10], [-2, 10], [-2, 0]]);
                polygon([[-slitH, 0], [-slitH, 9], [-slitH - 1, 10], [-slitH + 2, 10], [-slitH + 2, 0]]);
            }
        }
    }
}

translate([left ? 7 : W / 2, 0, 0]) {
    translate([0, 0, H + 0.08])
        cube([W / 2 - (left ? 7 : 2), 0.2, 5]);
    translate([0, 0, -5.08])
        cube([W / 2 - (left ? 7 : 2), 0.2, 5]);
}

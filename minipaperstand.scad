Wunit = 45;
D = 120;
H = 70;
R = 10;
thick = 1.6;

for (x = [0, Wunit, Wunit * 2]) {
    translate([x, 0, 0]) {
        difference() {
            hull() {
                cube([Wunit + thick, D, 1]);
                for (y = [R, D - R])
                    translate([0, y, H - R])
                        rotate([0, 90, 0])
                            cylinder(r = R, h = Wunit + thick, $fn = 32);
            }
            translate([thick, 0, thick])
                cube([Wunit - thick, D, H]);
        }
    }
}
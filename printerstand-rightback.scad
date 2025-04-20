H = 60;
Wbase = 40;
Dbase = 100;
DcaseIn = 33;
WcaseIn = 100;
thick = 2;

difference() {
    cube([Wbase, Dbase, H]);
    translate([thick, thick, 0])
        cube([Wbase - thick * 2, Dbase - thick, H - thick]);
    translate([Wbase - thick - 10.4, 0, 0])
        cube([10.4, thick, thick + 0.5]);
}
translate([Wbase - WcaseIn * 2 - thick * 3, Dbase, 0]) {
    difference() {
        cube([WcaseIn * 2 + thick * 3, DcaseIn + thick * 2, H]);
        for (x = [thick, WcaseIn + thick * 2]) {
            translate([x, thick, 0])
                cube([WcaseIn, DcaseIn, H]);
            for (off = [20, WcaseIn - 20])
                translate([x + off, 0, 4])
                    rotate([-90, 0, 0])
                        cylinder(r = 2, h = DcaseIn + thick * 2, $fn = 32);
        }
    }
}
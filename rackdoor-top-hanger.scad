Win = 72;
Din = 15;
Hin = 6;
thick = 2;
Wwing = 15;

difference() {
    cube([Win + (Wwing + thick) * 2, Din, Hin + thick]);
    translate([Wwing + thick, 0, thick])
        cube([Win, Din, Hin]);
    cube([Wwing, Din, Hin]);
    translate([Wwing + Win + thick * 2, 0, 0])
        cube([Wwing, Din, Hin]);
    for (x = [Wwing / 2, Win + (Wwing + thick) * 2 - Wwing / 2]) {
        translate([x, Din / 2, Hin])
            cylinder(r1 = 3.5, r2 = 1.5, h = thick, $fn = 16);
    }
}

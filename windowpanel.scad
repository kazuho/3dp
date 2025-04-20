thick = 1.6;
flap = 8;
spacing = 0.2;
W = 140;
H = 250;

pillarH = 290;
pillarRW = 20;
pillarRD = 22;
pillarLW = flap + thick * 4 + spacing;
pillarLD = 39;
pillarLDoff = 3.5;

railDrear = 16.5;
railD = 2.4;
railH = 10;

guideW = 5;
guideH = 130;

//panelBottom();
//panelMid();
//panelTop();
// pillarL(290, 0);
// pillarL(290, 1);
//pillarL(290, 2);
//pillarR(290, 1);
//pillarR(290, 0); // x2
top();

module panelBottom() {
    translate([0, 0, -24])
        cube([W + flap * 2, thick, 24]);
    difference() {
        panelBase(160 + thick);
        rotate([0, 90, 0])
            linear_extrude(W + flap * 2)
                polygon([[-160, 0], [-160 - thick, thick], [-160 - thick, 0]]);
        translate([W / 2, thick, 0])
            cube([W, 100, railH]);
        translate([flap + (W - 110) / 2, 0, railH + thick * 2 + 10])
            cube([110, thick, 110]);
    }
    translate([flap + thick * 4, thick, railH])
        cube([W - thick * 8, thick * 2, thick * 2]);
}

module panelMid() {
    difference() {
        panelBase(290 + thick);
        rotate([0, 90, 0]) {
            linear_extrude(W + flap * 2) {
                polygon([[0, 0], [-thick, thick], [-thick, flap + thick], [0, flap + thick]]);
                polygon([[-290, 0], [-290 - thick, thick], [-290 - thick, 0]]);
            }
        }
    }
}

module panelTop() {
   difference() {
        panelBase(160 + thick);
        rotate([0, 90, 0])
            linear_extrude(W + flap * 2)
                polygon([[0, 0], [-thick, thick], [-thick, flap + thick], [0, flap + thick]]);
        translate([0, thick, 110])
            cube([300, 100, 100]);
    }
}

module panelBase(h) {
    linear_extrude(h)
        polygon([[0, 0], [W + flap * 2, 0], [W + flap * 2, thick + flap], [W + flap, thick], [flap, thick], [0, thick + flap]]);
}

module pillarR(h, bottom) {
    difference() {
        pillarBase(pillarRW, pillarRD, h, thick * 2, pillarRD - 5.5);
        translate([0, pillarRD * .75, h - 5])
            cube([pillarRW, pillarRD * .25, 5]);
        if (bottom) {
            translate([0, pillarRD - railDrear - railD, 0])
                cube([pillarRW, railD, railH]);
        } else {
            cube([pillarRW, pillarRD * .75 + spacing, 5]);
        }
    }
    if (bottom) {
        translate([0, 0, railH])
            linear_extrude(guideH)
                polygon([[-guideW, 0], [0, 0], [0, guideW]]);
    }
}

module pillarL(h, zi) {
    difference() {
        translate([pillarLW, 0, 0])
            mirror([-1, 0, 0])
                pillarBase(pillarLW, pillarLD, h, thick, pillarLD - 5.5 + pillarLDoff);
        translate([thick * 2, 0, 0])
            cube([pillarLW, pillarLD - pillarRD + pillarLDoff, h]);
        if (zi == 2)
            translate([0, 0, 220])
                cube([thick * 2, 10, 80]);

    }
    if (zi == 0)
        linear_extrude(guideH)
            polygon([[pillarLW, pillarLD - pillarRD + pillarLDoff], [pillarLW + guideW, pillarLD - pillarRD + pillarLDoff], [pillarLW, pillarLD - pillarRD + pillarLDoff + guideW]]);
}

module pillarBase(w, d, h, c, doff) {
    linear_extrude(h)
        polygon([[0, 0], [w, 0], [w, d - c], [w - c, d], [c, d], [0, d - c],
                [0, doff], [thick * 2 + flap + spacing * 2, doff],
                [thick * 2 + flap + spacing * 2, doff - thick - flap - spacing * 2],
                [thick * 2 + flap, doff - thick - flap - spacing * 2],
                [thick * 2, doff - thick - spacing * 2],
                [0, doff - thick - spacing * 2]]);
}

module top() {
    w = pillarRW + W + pillarLW - 2 * (thick * 2 + spacing);
    h = 67;
    difference() {
        linear_extrude(h + 8)
            polygon([[0, 0], [w, 0], [w, pillarRD - 5], [w - 5, pillarRD], [0, pillarRD]]);
        translate([0, pillarRD - 5.5 - thick - spacing * 2, 0])
            cube([w - pillarRW + thick * 2 + flap + spacing * 2, thick + spacing * 2, h - 10]);
        translate([0, pillarRD - railDrear - railD, h])
            cube([w, railD, 100]);
        translate([0, pillarRD - railDrear + thick * 2, h])
            cube([w, 100, 100]);
        cube([w - pillarRW, pillarRD, 21]);
        translate([0, pillarRD - railDrear - railD, h])
            cube([50, pillarRD, 100]);
        translate([0, pillarRD - thick * 3 + spacing * 2, 0])
            cube([10, 100, h]);
    }
}
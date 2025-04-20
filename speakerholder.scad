angle = -10;
dispD = 21;
frontH = 5;
rearH = 50;
thick = 3;

linear_extrude(15) {
    polygon([[-thick, -rearH],
             [0, -rearH],
             [0, 0],
             [dispD, 0],
             [dispD, -frontH],
             [dispD + thick, -frontH],
             angled(dispD + thick, thick + 5),
             angled(dispD, thick + 5),
             angled(dispD, thick),
             angled(dispD - 100, thick),
             angled(dispD - 100, 0)]);
}

function angled(x, y) = [
    dispD + (x - dispD) * cos(angle) - y * sin(angle),
    (x - dispD) * sin(angle) + y * cos(angle)];

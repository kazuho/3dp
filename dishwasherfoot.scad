W = 40;
D = 40;
H = 30;
C = 5;

difference () {
    linear_extrude(H)
        polygon([[C, 0], [W - C, 0],
                [W, C], [W, D - C],
                [W - C, D], [C, D],
                [0, D - C], [0, C]]);
    translate([0, 0, C * 2]) {
        linear_extrude(H - C * 2) {
            polygon([[C, C * 2], [C, D], [W - C, D]]);
            polygon([[C * 2, C], [W, D - C], [W, C]]);
        }
    }
}

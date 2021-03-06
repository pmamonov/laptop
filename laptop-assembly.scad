include <laptop.scad>
include <18650.scad>
include <bpi-m3.scad>
include <hdd25.scad>

rotate([0, 0, 0]) color("magenta") bottom();

color("blue") {
	y = 2 * R + T;
	z = D - HB + T;
	r = 18 + 2;
	l = 65 + 2;

	translate([W / 2 - 1.5 * l, y, z]) bat18650();
	translate([W / 2 - 0.5 * l, y, z]) bat18650();
	translate([W / 2 + 0.5 * l, y, z]) bat18650();
	translate([W / 2 - 1.5 * l, y + r, z]) bat18650();
	translate([W / 2 - 0.5 * l, y + r, z]) bat18650();
	translate([W / 2 + 0.5 * l, y + r, z]) bat18650();
}

translate([W - T, L / 2, D - HB + T + 2]) bpi_m3();

color("gray") translate([W / 2 - 35, L - 110, D - HB + T + 2]) hdd25();

rotate([60, 0, 0]) color("lightgreen") keyboard();

rotate([120, 0, 0])	color("cyan") lid();

color("yellow")
	rotate([0, 90, 0])
		translate([0, 0, 3 * HL / 2 + HO])
			cylinder(h = 3 * HL + 2 * HO, d = 3, center=true, $fn=FN);

color("yellow")
	rotate([0, 90, 0])
		translate([0, 0, W - (3 * HL / 2 + HO)])
			cylinder(h = 3 * HL + 2 * HO, d = 3, center=true, $fn=FN);

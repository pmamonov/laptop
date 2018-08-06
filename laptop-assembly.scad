include <laptop.scad>

rotate([0, 0, 0]) color("magenta") bottom();

rotate([0, 0, 0]) color("lightgreen") keyboard();

rotate([90, 0, 0])	color("cyan") lid();

color("yellow")
	rotate([0, 90, 0])
		translate([0, 0, 3 * HL / 2 + HO])
			cylinder(h = 3 * HL + 2 * HO, d = 3, center=true, $fn=FN);

color("yellow")
	rotate([0, 90, 0])
		translate([0, 0, W - (3 * HL / 2 + HO)])
			cylinder(h = 3 * HL + 2 * HO, d = 3, center=true, $fn=FN);

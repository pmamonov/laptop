module bat18650()
{
	d = 18;
	h = 65;
	translate([h / 2, d / 2, d / 2]) rotate([0, 90, 0]) cylinder(d=d, h=h, center=true);
}

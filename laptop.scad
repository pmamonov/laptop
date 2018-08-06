/* configurable parameters */

W	= 300;		// width
L	= 200;		// length
HB	= 25;		// bottom height
HT	= 7;		// lid height
T	= 2;		// walls thickness
C	= 0.05;		// corner radius as fraction of (W + L) / 2
R	= 5;		// hinge radius
HL	= 25;		// hinge length
FN	= 30;		// parts "quality"

KW = 280;
KL = 80;
KH = 5;

HO	= C * (W + L) / 2;	// hinge offset
D	= R;			// body z-axis displacement

module round_cube(w, l, h, c=C) {
	r = c * (w + l) / 2;
	hull() {
		translate([r, r, h / 2])
			cylinder(h, r=r, center=true, $fn=FN);
		translate([w - r, r,  h / 2])
			cylinder(h, r=r, center=true, $fn=FN);
		translate([r, l - r,  h / 2])
			cylinder(h, r=r, center=true, $fn=FN);
		translate([w - r, l - r,  h / 2])
			cylinder(h, r=r, center=true, $fn=FN);
	}
}

module round_box(w, l, h, t)
{
	difference() {
		round_cube(w, l, h);
		translate([t, t, t])
			round_cube(w - 2 * t, l - 2 * t, h);
	}
}

module cyl_hole(h, dout, din=3)
{
	translate([0, 0, h / 2])
		difference() {
			cylinder(d = dout, h = h, center=true, $fn=FN);
			cylinder(d = din, h = h * 1.1, center=true, $fn=FN);
		}
}

module bottom()
{
	lho = HO;
	rho = W - HO - HL;
	difference() {
		union() {
			translate([0, R, D - HB])
				round_box(W, L, HB - T, T);

			translate([lho, 0, 0])
				rotate([0, 90, 0])
					cyl_hole(HL, 1.9 * R);
			translate([lho, -R, D - HB])
				cube([HL, 2 * R + T, HB - R], center=false);
			translate([lho, 0, D - HB])
				cube([HL, R + T, HB - T], center=false);

			translate([rho, 0, 0])
				rotate([0, 90, 0])
					cyl_hole(HL, 1.9 * R);
			translate([rho, -R, D - HB])
				cube([HL, 2 * R + T, HB - R], center=false);
			translate([rho, 0, D - HB])
				cube([HL, R + T, HB - T], center=false);
		}
		rotate([0, 90, 0])
			translate([0, 0, W / 2])
				cylinder(h = W, d = 3, center=true, $fn=FN);
	}
}

module keyboard()
{
	lho = HO + 2 * HL;
	rho = W - HO - 3 * HL;
	difference() {
		union() {
			difference() {
				translate([0, R, D - T])
					round_cube(W, L, T);
				translate([(W - KW) / 2, (L - KL) / 2 + R, D - 1.05 * T])
					cube([KW, KL, 1.1 * T], center=false);
			}

			translate([lho, 0, 0])
				rotate([0, 90, 0]) cyl_hole(HL, 1.9 * R);
			translate([lho, 0, D - T])
				cube([HL, 2 * R, T], center=false);
			translate([lho, -0.95 * R, D - R])
				cube([HL, 1.9 * R, R], center=false);

			translate([rho, 0, 0])
				rotate([0, 90, 0])
					cyl_hole(HL, 1.9 * R);
			translate([rho, 0, D - T])
				cube([HL, 2 * R, T], center=false);
			translate([rho, -0.95 * R, D - R])
				cube([HL, 1.9 * R, R], center=false);
		}
		rotate([0, 90, 0])
			translate([0, 0, W / 2])
				cylinder(h = W, d = 3, center=true, $fn=FN);
	}
}

module lid()
{
	lho = HO + 1 * HL;
	rho = W - HO - 2 * HL;
	difference() {
		union() {
			translate([0, R, HT + D])
				mirror([0, 0, 1])
					round_box(W, L, HT, T);

			translate([lho, 0, 0])
				rotate([0, 90, 0])
					cyl_hole(HL, 1.9 * R);
			translate([lho, -0.95 * R, D - R])
				cube([HL, 1.9 * R, HT + R], center=false);
			translate([lho, 0, D])
				cube([HL, R + T, HT], center=false);

			translate([rho, 0, 0])
				rotate([0, 90, 0])
					cyl_hole(HL, 1.9 * R);
			translate([rho, -0.95 * R, D - R])
				cube([HL, 1.9 * R, HT + R], center=false);
			translate([rho, 0, D])
				cube([HL, R + T, HT], center=false);
		}
		rotate([0, 90, 0])
			translate([0, 0, W / 2])
				cylinder(h = W, d = 3, center=true, $fn=FN);
	}
}

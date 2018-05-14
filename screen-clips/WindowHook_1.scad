cylinder_outer_d=8.65;
cylinder_inner_d=5.50;
flap_z=3.5;
flap_y=cylinder_outer_d;
flap_r=cylinder_outer_d/2;
flap_x=21.50-flap_r-flap_r;

height=32.77;


difference() {
    union() {
        cylinder(h=height, d=cylinder_outer_d, $fn=360);
        translate([-cylinder_outer_d/2, -cylinder_outer_d/2, 0]) {
            translate([cylinder_outer_d/2, 0, 0]) {
                union() {
                    translate([0, flap_r, 0]) {
                        cylinder(h=flap_z, d=flap_y, $fn=360);
                    }
                    translate([flap_x, flap_r, 0]) {
                        cylinder(h=flap_z, d=flap_y, $fn=360);
                    }
                    cube([flap_x, flap_y, flap_z]);
                }
            }
        }
    }
    cylinder(h=height, d=cylinder_inner_d, $fn=360);
}

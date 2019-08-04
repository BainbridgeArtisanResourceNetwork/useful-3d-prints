// number of faces for rendering
$fn = 50;


difference() {
    // create outer ring
    cylinder(r=102,h=3.5, center=true);
    
    // difference with inner ring
    cylinder(r=57,h=4,center=true);
}

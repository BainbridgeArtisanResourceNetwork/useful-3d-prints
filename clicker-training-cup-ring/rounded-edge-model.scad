$fn = 100; // improve local rendering

ring_height = 4;
circle_dia = ring_height;
outer_ring = 102 - (circle_dia/2);
inner_ring = 58 + (circle_dia/2);

ring_width = outer_ring - inner_ring;


// test one
// started with basic example of rotating a 1.5 x 2.5 square around 0
*rotate_extrude()
    translate([(16.1/2)+(1.5/2),0,0])
    square([1.5,2.5],center=true);

// test two
// take inside diameter into account by translating by its radius
*rotate_extrude()
    translate([(inner_ring/2)+(1.5/2),0,0])
    square([1.5,2.5],center=true);

// test 3
// here we're taking into account the true width
// in the translation and in the rotation
*rotate_extrude()
    translate([(inner_ring/2)+(ring_width/2),0,0])
    square([ring_width,2.5],center=true);

// test 4
// make it correct height
*color([0,.5,0,.5])
rotate_extrude()
    translate([(inner_ring/2)+(ring_width/2),0,0])
    square([ring_width/2,ring_height], center=true); 

// test 4.1
// color([0,.5,0,.5])
// also quit centering at origin, just start from there
*rotate_extrude()
    translate([(inner_ring/2),0,0])
    square([ring_width/2,ring_height]);

// test 5
// lets camfer the edges by adding a circle to the translation

color("red")
*rotate_extrude() {
    translate([(inner_ring/2)-(ring_height/4),ring_height/2,0])
    circle(r=ring_height/2);
}

color("blue")
*rotate_extrude() {
    translate([(outer_ring/2) + (ring_height/4 ),ring_height/2,0])
    circle(r=ring_height/2);
}

// test 6
// This is the version that works best
// let's union them all together...
rotate_extrude() {
    translate([(inner_ring/2),0,0])
    square([ring_width/2,ring_height]);

    union() {
        translate([(inner_ring/2)-(ring_height/6),ring_height/2,0])
        circle(r=ring_height/2);
    }
   
    union() {
        translate([(outer_ring/2) + (ring_height/6 ),ring_height/2,0])
        circle(r=ring_height/2);
    }
}


// Seems to be an obvius thing but nobody has made me a smart phone stand
// for my HTC Desire so I am going to try myself.
// 
// I would like to have it so that I can put a power plug in it. Simplest may
// be just to make it so that it has a gap at the  front to allow for power.

// Could do two hands, just need a scad image to use...

module hand () {
    scale([ 0.5, 0.5, 0.5 ]) 
       {import_stl("big-hand.stl", convexity = 5);}



}

module htc_desire () {
    // This should be a basic shape of the phone
    cube ([50, 10, 100]);
}


module main () {
    // This is the main module
  difference () {
  union () {
    rotate ([-20,0,0]) {
        translate ([-17,1,1]) {
          rotate ([0,0,-5]) {
            hand();
          }
        }
        translate ([17,1,1]) {
          mirror() {
            hand();
          }
        }
    }
    translate ([-25, 0, 0]) {
      cube([50,50,5]);
    }
  }
    translate ([-25, 0, -5]) {
      cube([50,50,5]);
    }
    translate ([0, 25, -0.1]) {
      cylinder(h=0.9, r=20);
    }
    translate ([18, 7, -0.1]) {
      cylinder(h=0.9, r=6);
    }
    translate ([-18, 7, -0.1]) {
      cylinder(h=0.9, r=6);
    }
    translate ([18, 43, -0.1]) {
      cylinder(h=0.9, r=6);
    }
    translate ([-18, 43, -0.1]) {
      cylinder(h=0.9, r=6);
    }
  }

  //  translate ([-25,-2,28]) {
   //   rotate ([-15, 0, 0]) {
  //      htc_desire();
  //    }
  //  }


}

// This is the main thing
main();

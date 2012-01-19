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
        translate ([-20,1,1]) {
          rotate ([0,0,-8]) {
            hand();
          }
        }
        translate ([20,1,1]) {
          mirror() {
            hand();
          }
        }
    }
    minkowski () {
        difference () {
          translate ([0, 15, 0]) {
            cylinder(h=2, r=25.1);
          }
          translate ([0, 24, -0.1]) {
            cylinder (h=2.2, r=14);
          }
        }
        rotate ([90,0,0]) {
          cylinder (h=2, r=2.4);
        }
    }
  }
    translate ([-50, -30, -5]) {
      cube ([100,100,5]);
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

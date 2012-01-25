// Handy phone holder
// For my HTC Desire.

//  Copyright 2011 John Cooper 
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//   (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

// Make the curves more curvey
$fs=0.2;

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

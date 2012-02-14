// This is a simple cart to house my ir tracker bot.

//
//  Copyright 2012 John Cooper 
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

module motor_holder () {
  rotate ([0, -90, 0]) {
    union () {
      difference () {
        cylinder (h=25, r=11);
        translate ([0, 0, -0.1]) {
          cylinder (h=26, r=10);
        }
        translate ([0, -12, -0.1]) {
          cube ([25, 25, 26]);
        }
      }
      // base support
      translate ([-(10  ), -10, 0]) {
        cube ([2.5, 20, 25]);
      }
      // end stops
      difference () {
        for ( x = [0, 1] ) {
          translate ([-6, 0, -1 + x * 27]) {
            cube ([8, 20, 2], center=true);
          }
        }
        // spindle end hole
        translate ([-1.5, 0, -2]) {
          cylinder (h=2, r=3.2);
        }
        // other end hole
        translate ([-1.5, 0, 25]) {
          cylinder (h=2, r=5.2);
        }
      }
      // clip
      translate ([-1, 0, 10]) {
        difference () {
          cylinder (h=3, r=12);
          translate ([-2, 0, -0.1]) {
            cylinder (h=3.2, r=11);
          }
          translate ([8, 0, -0.1]) {
            cylinder (h=3.2, r=8);
          }
        }
      }
    }
  }
}

module led_holder () {
  difference () {
    rotate ([-90,0,0]) {
      difference () {
        cylinder (h=27, r1=4, r2=30);
        translate ([0, 0, -0.1]) {
          cylinder (h=27.2, r1=3, r2=28);
        }
      }
    }
    translate ([-30,-1,-31]) {
      cube ([60,35,30]);
    }
  }
}

module tail () {
  union () {
    translate ([-1.5, -20, 0]) {
      cube([3, 20, 3]);
    }
    translate ([0, -19.5, 3]) {
      sphere (r=3);
    }
  }
}


module circuit_board () {
  translate ([-20, 0, 0]) {
    cube ([40, 60, 6]);
  }
}

module base () {
  difference () {
    cylinder (h=3, r=60);
    for ( x = [1, -1]) {
      translate ([85 * x, -40, -0.1]) {
        cylinder (h=3.2, r=60);
      }
    }
    translate ([0,-45,2]) {
      circuit_board();
    }
  }
}

module motor() {
  union () {
    difference () {
      cylinder (h=25, r=10);
      for ( x = [1, -1]) {
        translate ([(17.5 * x) -10, -20, 0]) {
          cube ([20, 40, 28]);
        }
      }
    }
    translate ([0, 0, 25]) {
      cylinder (h=2.5, r=3);
    }
    translate ([0, 0, 27.5]) {
      cylinder (h=8.6, r=1);
    }
    translate ([0, 0, -2.5]) {
      cylinder (h=2.5, r=5);
    }
  }
}


module main () {
  union () {
    base ();
    translate ([0, -57, 0]) {
      tail ();
    }
    translate ([0, 59, 0]) {
      cylinder (h=3, r=8);
    }
    for ( x = [1, -1]) {
      translate ([45 * x + 10, 15, 11]) {
        motor_holder();
      }
      translate ([3 * x, 27, 3]) {
        rotate ([0,0, -42.5 * x ]) {
          led_holder();
        }
      }
    }
  }

  translate ([30, 15, 9]) {
    rotate ([0, 90, 0]) {
      // motor();
    }
  }
}


main ();

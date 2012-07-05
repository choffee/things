// Saddle bag support bar
// Designed to go from the back of a carradice saddle bag to the seat post.
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

hlength = 70;
hwidth  = 25;
hheight = 20;
postr = 26 / 2;
// band width
bwidth = 3;
$fs=0.2;


module spring_cutout () {
  rotate([0, 0, 180]) {
    union () {
      cube([1.2, hwidth * 0.8, (hheight + 2)]);
      translate ([1, 0, 0]) {
        cylinder(h=hheight + 2, r=1);
      }
    }
  }
}

module tube (rout,rin,l) {
  difference () {
    cylinder(h=l, r=rout);
    translate([0,0,-1]) {
      cylinder(h=l+2, r=rin);
    }
  }

}

module handle () {
  difference() {
    cube([hlength, hwidth, hheight]);
    for ( y = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] ) {
      translate ([y * 6,0,-1]) {
        for ( l = [0, 1] ) {
          rotate( [0, 0, l * 180]) {
            translate([3 - (7 * l) ,( hwidth * 0.75 ) - (hwidth * l) ,0]) {
              spring_cutout();
            }
          }
        }
      }
    }
    // Round the corners
    translate ([-1, hwidth /2 , hwidth / 2.5 ] ) {
      rotate([0,90,0]) {
        tube(hwidth / 1.2, hwidth / 1.8 -1 , hlength+2);
      }
    }

  }
}

module clamp() {
  translate([hlength, -hwidth * 0.25, 0]) {
    difference () {
      cube([postr * 1.2, hwidth * 1.5, hheight * 1.2]);
      translate ([postr * 1.2, (hwidth * 0.75)  , -1]) {
        cylinder(r=postr, h=hheight * 1.2 + 2);
      }
      for (l = [0, 1]) {
        translate ([postr, bwidth * 2 +  l * (hwidth + bwidth), postr]) {
          rotate ([90,0,0]) {
            tube( postr * 2, postr * 1.2, bwidth);
          }
        }
      }
    }
  }

}

module clip () {
  translate ([-5, 4, 0]) {
    union () {
      cube ([5, 2, 10]);
      cube ([2, hwidth * 0.6, 10] );
    }
  }

}

module main () {
  // The main device
  union () {
    handle();
    clamp();
    clip(); 
  }
}



main();


// Park bench ends for coffee stirers
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

// Add some smoothing
$fs=0.2;

// Stirer dimentions
st_w=6.5;
st_h=1.4;

// Some useful numbers
height=st_w;

module back() {
  translate([0, st_w * 3.8, 0]) {
    rotate([0, 0, 15]) {
      difference() {
        back_shape();
        back_holes();
      }
    }
  }
}

module back_shape() {
  union() {
    cube([st_h * 5, st_w * 6.5, height]);
    translate([st_h, st_w * 6.5,0]){
      cylinder(r=st_h * 4, h=height);
    }
  }
}

module back_holes() {
  for ( l = [0,1,2,3] ) {
    translate([st_h * 2, st_w * ( 1.6 * l + 0.5 ), -0.5]) {
        cube([st_h, st_w, height+1]);
      }
    }
}


module leg_back() {
  difference() {
    translate([-st_h, 0, 0]) {
      rotate([0, 0, -5]) {
        cube([st_h * 5, st_w * 3.8, height]);
      }
    }
    // Cut the bottom of the leg off flat
    translate([-st_w * 2, -st_w * 4, -height]) {
      cube([st_w * 4, st_w * 4,height * 3]);
    }
  }
}
module leg_front() {
  difference() {
    translate([st_w * 6, 0, 0]) {
      rotate([0, 0, 5]) {
        cube([st_h * 5, st_w * 4, height]);
      }
    }
    translate([st_w * 4, -st_w * 4, -height]) {
      cube([st_w * 4, st_w * 4,height * 3]);
    }
  }
}
module seat() {
  translate([0, st_w * 3.4, 0]) {
    rotate([0, 0, 5]) {
      difference() {
        seat_shape();
        translate([st_w * 0.5, st_h * 5 ,0]) {
          rotate([0,0,-90]) {
            back_holes();
          }
        }
      }
    }
  }
}

module seat_shape() {
      cube([st_w * 6.5, st_h * 5, height]);
      translate([st_w * 6.5, st_h * 1, 0]) {
        cylinder(r=st_h * 4, h=height);
      }
}

module part() {
  union(){
    back();
    leg_back();
    leg_front();
    seat();
  }
}


part();

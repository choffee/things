// Mini motorised tool holder for Dyson.
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

tube_inner = 28 / 2;
tube_outer = 35 / 2;
tube_length = 36;
tab_length = 16;
bigtube_outer = 50 / 2 ;
bigtube_offset = 4;
tube_gap = 3.4;
bott_height = 4;
back_width = tube_outer + tube_gap + 40;

module tube() {
  // Outer
  difference () {
    cylinder(r=(tube_outer + tube_gap), h = tube_length + bott_height);
    translate([0,0,bott_height]) {
      difference () {
        cylinder(r=(tube_outer), h = tube_length + 1 );
        cylinder(r=(tube_inner), h = tube_length + 1 );
      }
    }
    translate([-tube_outer - 9, 0, tube_length + bott_height]) {
      rotate([0,90,0]) {
        cylinder(h=10, r=tab_length);
      }
    }
  }
}

module screw_hole() {
  translate([-9,0,0]) {
    rotate ([0,90,0]) {
      union () {
        cylinder(r=4, h=20);
        cylinder(r=7, h=15);
        translate([0, 0, 15]) {
          cylinder(h=2, r1=7, r2=4);
        }
      }
    }
  }
}

module back() {
  difference () {
    union() {
      cube ([10, back_width, 20]);
      translate([0,0,- tube_length - bott_height]) {
        cube([10, back_width, tube_length + bott_height]);
      }
    }
    translate([-bigtube_outer + bigtube_offset, 30, 0]) {
      cylinder(r=bigtube_outer, h=30);
    }
    for (f = [0,-1]) {
      translate([0, ( back_width / 1.4 ) * f + ( back_width * 0.85 ), 9]){
        screw_hole();
      }
    }
  }
}



tube();
translate([tube_outer, - back_width / 2, tube_length + bott_height]) {
  back();
}

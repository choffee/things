// Scad Template
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

width=150;
depth=60;

module back() {
  translate([0, -10, 0]) {
    cube([150, 10, 20]);
  }
  translate([0,-10,20]) {
    mountain(2);
  }
  translate([0,20,20]) {
    mountain(1.2);
  }
  translate([width, -10, 20]) {
    rotate([0,0,90]) {
      mountain(2,10);
      translate([0,10,0]) {
        mountain(2.2,10);
      }
      translate([0,40,0]) {
        mountain(1.4,10);
      }
      translate([0,100,0]) {
        mountain(1.2,10);
      }
      translate([0,110,0]) {
        mountain(1.7,10);
      }
      translate([0,120,0]) {
        mountain(2.2,10);
      }
    }
  }
}

module mountain(size, depth=5) {
  polyhedron(
    points = [ [0,0,0], [depth,0,0], [depth,20 * size,0], [0, 20 * size, 0], // the base
               [0,10 * size,20 * size] ], // The top
    triangles = [[0, 3, 4], // back
                 [0, 1, 4], [2, 3, 4], //sides
                 [1, 2, 4], // Front
                 [0, 1, 2], [0, 4, 2] ] // base
                 );
}

module snowboard() {
  cube([15, 50, 50]);
}

module base() {
  difference () {
    // Main base
    cube([width, depth, 20]);
    // Carve out the main shape
    translate([5, 0, 10]) {
      rotate([5, 0, 0]) {
        cube([width -10, depth * 1.2, 20]);
      }
    }
    // Remove the snowboards
    for ( r = [0,1,2,3,4,5,6] ) {
      translate([10 + r * 20, 3, -1]) {
        snowboard();
      }
    }
  }

}

union() {
  base();
  back();
}

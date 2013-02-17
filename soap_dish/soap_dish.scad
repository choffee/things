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
  union () {
    translate([0, -12, 0]) {
      cube([150, 12, 20]);
    }
    translate([0,-10,19]) {
      mountain(2);
    }
    translate([0,20,19]) {
      mountain(1.2);
    }
    translate([width, -12, 19]) {
      rotate([0,0,90]) {
        union () {
          mountain(2,10);
          translate([0,10,0]) {
            mountain(2.2,12);
          }
          translate([0,40,0]) {
            mountain(1.4,12);
          }
        }
        union () {
          translate([0,100,0]) {
            mountain(1.2,12);
          }
          translate([0,110,0]) {
            mountain(1.7,12);
          }
          translate([0,120,0]) {
            mountain(2.2,12);
          }
        }
      }
    }
  }
}

module mountain(size, depth=5) {
  polyhedron(
    points = [ [0,0,0], [depth,0,0], [depth,20 * size, 0], [0, 20 * size, 0], // the base
               [0,10 * size,20 * size] ], // The top
    triangles = [[0, 3, 4], // back
                 [0, 4, 1], [3, 2, 4], //sides
                 [1, 4, 2], // Front
                 [0, 1, 2], [0, 2, 3] ] // base
                 );
}

module snowboard() {
  minkowski () {
    difference () {
      cube([10, 55, 30]);
      // Cut out the sides
      for ( r= [ 1, -1] ) {
        translate([5 + (112 * r ),25,0]) {
          cylinder(r=110, h=52, $fn=200);
        }
      }
    }
    cylinder(r=5, h=20);
  }
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
      translate([10 + r * 20, 6, -1]) {
        scale (0.8) {
          snowboard();
        }
      }
    }
  }

}

module hookhole() {
  // These are for some 3M mini hhoks 17006H
  difference () {
    union () {
      // Back plane
      cube([25, 30, 2.5]);
      // Space for the hook
      translate([(25 / 2 ) - ( 7 / 2 ), 0, 0]){
        cube([7, 18 +4.5, 11]);
      }
    }
    translate([0, 9, 2.7]) {
      cube([30, 25, 4]);
    }
  }
}

difference() {
  union() {
    base();
    back();
  }
  translate([-100,-30,0]) {
    cube([100,100,100]);
  }
  // Add some holes for hooks.
  for ( l = [0, 1]) {
    translate([30 + ( l * 90 ), -12.1, -0.1]) {
      rotate([0,180,0]){
        rotate([-90, 0, 0]) {
          hookhole();
        }
      }
    }
  }
}



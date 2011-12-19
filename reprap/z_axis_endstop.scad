// This is my adjustable z-axis mechanical endstop.

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

use <MCAD/nuts_and_bolts.scad>;
include <MCAD/nuts_and_bolts.scad>;
// It comes from the problem that I don't have a good way to adjust the Z-axis
// but it needs to be really accurate.
// The default prusa one keeps moving about.

// This one will have a longer length of clamp on the rod so that it can be
// fixed and then use a screw above to adjust the level to a finer level.

rod_radius = 8 / 2;
wall_thickness = 3;
clip_length = 20;
bolt_size = 3;
nut_space = 5;
switch_length = 30;
switch_nut_sep_x = 22.2;
switch_nut_sep_y = 10.3;

// 1.5 - 3.3 15.85
// 1.3 kkk
// Model: Contact_Plate
// This model is just a simple plate that glues onto the side of the Y-Axis
// holder and has a screw that points down to make contact with the switch below
// It has a single hole that you should glue in a locking nut
module contact_plate () {
  difference () {
    union () {
      cube ([20, 10, 3]);
      translate ([10, 0, 0]) {
        cube ([10, 10, 10]);
      }
    }
    translate ([15, 5, -0.1]) {
        translate ([0,0,7.8]) {
          nutHole (size=3);
        }
      boltHole (size=3, length=15);
    }
  }

}

module switchHolder () {
  holder_height = switch_nut_sep_y + (2 * nut_space);

  difference () { 
    cube ([switch_length + rod_radius + nut_space, wall_thickness * 2, holder_height]);
    translate ([nut_space, -1, nut_space]) {
      rotate([90,0,180]) { boltHole( length=wall_thickness * 3, size=bolt_size); }
    }
    translate ([nut_space + switch_nut_sep_x , -1, nut_space + switch_nut_sep_y]) {
      rotate([90,0,180]) { boltHole( length=wall_thickness * 3, size=bolt_size); }
    }
    translate ([nut_space, -0.1, nut_space]) {
      rotate([90,0,180]) { nutHole( length=wall_thickness * 3, size=bolt_size); }
    }
    translate ([nut_space + switch_nut_sep_x , -0.1, nut_space + switch_nut_sep_y]) {
      rotate([90,0,180]) { nutHole( length=wall_thickness * 3, size=bolt_size); }
    }
  }

}

module endstopHolder () {
  nut_width = METRIC_NUT_AC_WIDTHS[bolt_size];
  outer_radius = rod_radius + wall_thickness;
  plate_width = rod_radius + nut_space + nut_width + nut_space;
  bolt_length = 2 * ( rod_radius ) + 2 * wall_thickness;
  bolt_width = SE_METRIC_BOLT_MAJOR_THREAD_DIAMETERS[bolt_size]; 
  bolt_offset = rod_radius + nut_space +nut_width/2;
  switch_x_offset = switch_length + nut_space + rod_radius;
  difference () {
    union () {
      cylinder (h=clip_length, r=outer_radius);
      translate ([0, - outer_radius, 0]) {
        cube ([plate_width, outer_radius * 2, clip_length]);
      }
      translate ([- switch_x_offset, rod_radius - wall_thickness, 0]) {
        switchHolder ();
      }
    }
    // Rod cutout
    translate ([0, 0, -0.1]) {
        cylinder (h=clip_length + 5, r=rod_radius);
    }
    // Space
    translate ([0, -rod_radius * 0.6, -0.1]) {
      cube ([plate_width + 0.2, rod_radius * 1.2, clip_length + 0.2]);
    }
    // Now the bolt holes
    translate ([bolt_offset, rod_radius +3.61, nut_space]) {
      rotate([90,0,0]) { boltHole( length=bolt_length, size=bolt_size); }
    }
    translate ([bolt_offset, rod_radius +3.61, clip_length - nut_space]) {
      rotate([90,0,0]) { boltHole( length=bolt_length, size=bolt_size); }
    }
    translate ([bolt_offset, - (rod_radius + 0.61), nut_space]) {
      rotate([90,0,0]) { nutHole( size=bolt_size); }
    }
    translate ([bolt_offset, - (rod_radius + 0.61), clip_length - nut_space]) {
      rotate([90,0,0]) { nutHole( size=bolt_size); }
    }
  }

}

// endstopHolder();

contact_plate();


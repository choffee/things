// That part for Prit's car vent.
//
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

$fs=0.2;

module oblong(len,width,height) {
  union() {
    cube([len - (width), width, height]);
    for ( l = [0, 1] ) {
      translate([l * (len - (width)), width/2, 0]) {
        cylinder(r=width/2, h=height);
      }
    }
  }
}

top_len=110;
top_width=20;
inner_len=100;
inner_width=10;
inner_height=14;
inner_thickness=2;

difference() {
  union() {
    difference() {
      oblong(top_len, top_width, 2);
      translate([0, top_width/2, top_width]) {
        rotate([0,90,0]) {
          cylinder(r=20, h=inner_len - inner_width);
        }
      }
      for ( l = [0, 1] ) {
        translate([l * (inner_len - top_width/2),top_width/2,top_width ]) {
          sphere(r=top_width);
        }
      }
    }
    translate ([0,(top_width - inner_width)/2,0]) {
      oblong(inner_len, inner_width, inner_height);
    }
  }
  translate([0, (top_width - inner_width + inner_thickness)/2, -0.5]) {
    oblong(inner_len - inner_thickness, inner_width - inner_thickness, inner_height+1);
  }
}

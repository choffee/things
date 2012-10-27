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

top_len=135.26;
top_width=21.1;
inner_len=125.4;
inner_width=12.5;
inner_height=13.3;
inner_thickness=2;

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

module scoop_out() {
  translate([0, top_width/2, 20.2 ]) {
    rotate([0,90,0]) {
      cylinder(r=20, h=inner_len - inner_width);
    }
  }
  for ( l = [0, 1] ) {
    translate([l * (inner_len - top_width/2),top_width/2,top_width +0.2 ]) {
      sphere(r=top_width);
    }
  }
}

module end_stops() {
  for ( l = [0, 1] ) {
    translate([((inner_len - 0.5) * l)-(inner_width/2 + 1 ),top_width/2 - 1, inner_height - 1.5]) {
      rotate([0, 45, 0]) {
        cube([2,2,2]);
      }
    }
  }
}

difference() {
  union() {
    difference() {
      // Top flange
      oblong(top_len, top_width, 2);
      scoop_out();
    }
    translate ([0,(top_width - inner_width)/2,0]) {
      // Insert
      oblong(inner_len, inner_width, inner_height);
    }
    end_stops();
  }
  translate([0, (top_width - inner_width + inner_thickness)/2, -0.5]) {
    // Insert cut out
    oblong(inner_len - inner_thickness, inner_width - inner_thickness, inner_height+1);
  }
}

//  Mugs that clip together for easier carrying
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

module rounded_stick(height=10, width=5, depth=2) {
  cube ([depth, width, height]);
  translate ([0, width / 2, height]) {
    rotate ([0, 90, 0]) {
      cylinder (h=depth, r=width / 2 );
    }
  }
}

module top_clip() {
  c_width=10;
  c_height=20;
  c_depth=4;
  c_inner_width = c_width * 0.3;
  rounded_stick(height=c_height, width=c_width, depth=c_depth);
  translate ([c_depth, (c_width - c_inner_width ) / 2, 0]) {
    rounded_stick(height=c_height * 0.8, width=c_inner_width, depth=c_depth);
  }
  translate ([0, 0, -(c_height * 0.8)]) {
    difference () {
      cube ([c_depth * 0.9, c_width, c_height * 0.8]);
      translate ([-0.1, (c_width - c_inner_width * 1.1) / 2, -c_inner_width]) {
        rounded_stick(height=c_height * 0.8, width=c_inner_width * 1.1, depth=c_depth * 1.1);
      }
    }
  }
  translate ([c_depth, c_width / 2, -(c_height * 1.8 )]) {
    difference () {
      cylinder (h=c_height , r= c_width / 1.8);
      translate ([-c_depth, -c_width, c_height /1 ]) {
        rotate ([0,160,0]) {
          cube ([c_height, c_height, c_height * 2]);
        }
      }
      translate ([-c_depth, - c_inner_width / 2, -(c_height * 0.9) ]) {
        cube ([c_depth * 2 , c_inner_width, c_height * 2]);
      }
    }
  }
}



module handle () {
  // Just a plain handle
}

module cup () {
  difference () {
    cylinder (h=100, r=50);
    translate ([0, 0, 10]) {
      cylinder (h=900, r=45);
    }
  }
  translate ([-( 50 + 7 ), 0, 77]) {
    top_clip();
  }
}

module main () {
  cup();
}

main ();


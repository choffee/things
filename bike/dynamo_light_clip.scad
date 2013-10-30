// Dynamo clip for Brompton
//
//  Copyright 2013 John Cooper
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

include <../MCAD/nuts_and_bolts.scad>

// Add some smoothing
$fs=0.2;
$fa=2;
//$fn=100;

tubewidth=(22.4 / 2);
length=30;

clampout=( 17 / 2);
screwwidth=(6.5 / 2);
clampcut=8.6;
screwlength=15;
screwhead=(11 / 2);

module tie_wrap_cutout() {
  difference() {
    cylinder(r= (tubewidth + 6), h=3);
    translate([0, 0, -1]){
      cylinder(r= (tubewidth + 3.5), h=6);
    }
  }
}

module tubeclamp() {
  rotate([0, 90, 0]) {
    difference () {
      translate([-3, 0, 0]) {
        cylinder(r=(tubewidth + 4), h=length + 15);
      }
      translate([0, 0, -1]) {
        cylinder(r=tubewidth, h=length+17);
      }
      translate([0, -50, -10]) {
        cube([100, 100, 100]);
      }
      for ( l = [0, 1] ) {
        translate([-3, 0, 2 + ( l * (length + 8))]) {
          tie_wrap_cutout();
        }
      }
    }
  }
}


module lampconnector() {
  rotate([0, 90, 0]) {
    difference() {
      // outer and sides
      union() {
        cylinder(r=clampout, h=length);
        for ( l = [0, 1]) {
          translate([2 + (12 * l)  , 7.8 - (l * 18.9), 0]){
            rotate([0, 0, -74 + ( 148 * l)]){
              cube([9.6, 12.2, length]);
            }
          }
        }
      }
      // Cut off the bottom of the support cubes
      translate([14, -15, 0]) {
        cube([10, 100, 100]);
      }
      // screw
      translate([0, 0, -1]) {
        cylinder(r=screwwidth, h=(length + 2));
      }
      // cutout
      translate([-50, -50, (length / 2) - (clampcut / 2)]){
        cube([100, 100, clampcut]);
      }
      // screwhead
      translate([0, 0, (screwlength + ( length - screwlength)/ 2)]) {
        cylinder(r=screwhead, h=length);
      }
      // first nut
      translate([0, 0, -0.1]){
        nutHole(6);
      }
      // nut at distance
      translate([0, 0, ((length - screwlength)/2 - 6.5) ]){
        nutHole(6);
      }
    }
  }
}


module main() {
  union() {
    tubeclamp();
    translate([7.5, 0, (tubewidth + clampout + 8)]){
      lampconnector();
    }
  }
}


main();

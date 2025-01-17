# Paper shredder gear for cheap hand cranked paper shredder
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

// Make the curves more curvey
$fs=0.2;


use <MCAD/involute_gears.scad>
use <MCAD/shapes.scad>

$fs=0.4;

difference () {
    gear(
      gear_thickness = 6.83,
      rim_thickness = 6.83,
      hub_thickness = 6.83,
      rim_width = 16.5,
      hub_diameter = 16.5,
      number_of_teeth = 12,
      circular_pitch=210,
      circles=0
    );
    translate ([0,0,3.5]) {
        hexagon (height=8, size=5.42 );
    }
    // translate ([-8.25,-5.42/2,0]) {cube ([16.5,5.42,10]);}
}

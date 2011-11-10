// Half a bike clip
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
width=20;
depth=5;
bar_r=10;
length=50;

difference () { 
union () {
  translate ([0, 0, -( length / 2 ) ] ) {cube ( [width,depth, length] );}
  intersection () {
    translate ([0, 0, - (bar_r + depth) ] ) {
      cube ( [width, bar_r + depth, (bar_r + depth) * 2] );
    }
    rotate( a=[90, 0, 90]) { cylinder( h=width, r1=bar_r + depth, r2=bar_r + depth);}
  }
}
rotate(a=[90, 0, 90]) { cylinder( h=width, r1=bar_r, r2=bar_r); }
}

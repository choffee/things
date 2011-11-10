// Small clip to attach a wire to the back of a laptop screen
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

screen=10;
thickness=3;
s_inner=screen ;
s_outer=s_inner + thickness;
wire=3.5  + 1;
w_inner=wire  / 2;
w_outer=w_inner + thickness;
w_slot = wire * 0.7;
height=12;
out_r=((wire/2)+(thickness*1.1));
union () {
difference () {
    // Larger loop
    cylinder ( h=height, r1=s_outer, r2=s_outer );
    translate ( [0,0,-0.5] ) {
        cylinder ( h=height+1, r1=s_inner, r2=s_inner );
    }
    translate ([-(s_inner+thickness),0, -0.1]) {
        cube ([thickness * 3, screen * 0.8, height + 1]);
    }
}
translate ([-(s_inner + thickness ) ,0,0]){
    cylinder ( h=height, r1=thickness, r2=thickness);
}
translate ([-(sqrt(((s_inner + thickness) * (s_inner + thickness)) - (screen * 1 * screen * 1) )) ,screen * 1,0]){
    cylinder ( h=height, r1=thickness, r2=thickness);
}

translate ([-(s_inner - thickness),-(s_inner+ w_outer ),0]) {
    // Smaller Loop
    difference () {
        cylinder ( h=height, r1=w_outer, r2=w_outer);
        translate( [0,0,-0.5]) {
            cylinder ( h=height+1, r1=w_inner, r2=w_inner);
        }
        translate ([w_inner * 0.5, -(w_slot /  2 ), -0.1]) {
            cube ([thickness * 2 ,w_slot, height+1]);
        }
    }
}
}

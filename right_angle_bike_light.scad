//  Right angle bike light holder
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

bar_diameter = 23;
bar_radius = bar_diameter / 2;
clamp_width = 45;
cover_thickness = 5;
outer_cover_radius = bar_radius +  cover_thickness  ;
cover_length = bar_diameter + 30;
tiewrap_width=5;
tiewrap_depth=1.7;
penny_r= 20.41 / 2 + 1;
penny_w= 1.7 + 0.5;

module tube (length, outer_r, inner_r) {
    difference () {
        cylinder (h=length, r1=outer_r, r2=outer_r);
        translate ([-0.5,0,0]) {
            cylinder (h=length + 1, r1=inner_r, r2=inner_r);
        }
    }
}

module full_stand () {
union () {
difference () {
    union () {
        cylinder (h=clamp_width,r1=bar_radius,r2=bar_radius);
        translate ([0,0,clamp_width]){
            cylinder (h=5, r1=bar_radius, r2=bar_radius + 3);
        }
    }
    translate ([0,0,clamp_width]) {
        cylinder (h=6, r1=1, r2=bar_radius - 1);
    }
}

difference () {
    union () {
        cylinder(h=cover_thickness,r1=outer_cover_radius, r2=bar_radius );
        translate ([0,0,-bar_radius]) {
            cylinder(h=bar_radius,r1=outer_cover_radius, r2=outer_cover_radius);
        }

        translate ([- cover_length /2, 0, -bar_radius]) {
            rotate ([0,90,0]) {
                 cylinder (h=cover_length, r1=outer_cover_radius, r2=outer_cover_radius);
            }
        }
    }
    translate ([- cover_length / 2 -0.5, 0, -bar_radius]) {
        rotate ([0,90,0]) {
            cylinder(h=cover_length+1, r1=bar_radius, r2=bar_radius);
        }
    }
    translate ([-cover_length/2 - 0.5,-outer_cover_radius, -(outer_cover_radius * 2 - cover_thickness / 2 )]) {
        cube ([cover_length+1, outer_cover_radius * 2, outer_cover_radius]);
    }
    translate ([cover_length/2 - tiewrap_width * 2  ,0, -bar_radius]) {
        rotate([0,90,0]) {
            tube(length=tiewrap_width, inner_r=outer_cover_radius - tiewrap_depth, outer_r=outer_cover_radius + 1);
        }
    }
    translate ([-(cover_length / 2 - tiewrap_width ) ,0, -bar_radius]) {
        rotate([0,90,0]) {
            tube(length=tiewrap_width, inner_r=outer_cover_radius - tiewrap_depth, outer_r=outer_cover_radius + 1);
        }
    }
}
}
}

difference () {
    rotate([90,90,0]) {
        full_stand ();
    }
    translate ([-100,-100,-150]) {
        cube ([150,150,150]);
    }
    translate ([-penny_w/2, -clamp_width / 2, 0]) {
        rotate ([0,90,0]) {
            cylinder (h=penny_w, r1=penny_r, r2=penny_r);
        }
    }
}

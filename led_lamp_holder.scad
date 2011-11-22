// This is a led lamp holder to clip onto the RepRap.
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

bolt_thickness = 8;
lamp_radius = 27 / 2;
plug_width = 8;
strap_width = 10;

module bolt_clip (bolt_radius, length) {
    difference () {
        cylinder (h=length, r=bolt_radius * 1.1);
        translate ([0, 0, -0.5]) {
            cylinder (h=length + 1, r=bolt_radius);
        }
    }
}

module lamp_holder () {
    union () {
        difference () {
            cylinder ( h=9, r=lamp_radius + 2 );
            translate ([0,0,5]) {
                cylinder ( h=6, r=lamp_radius );
            }
            translate ([-( strap_width / 2 ), lamp_radius / 3, -0.5]) {
                 cube ([strap_width, 3, 5]);
            }
            translate ([-( strap_width / 2 ), - ( lamp_radius / 3 + 3) , -0.5]) {
                 cube ([strap_width, 3, 5]);
            }
            translate ([- (lamp_radius / 2 -2 ), -lamp_radius / 2, 3]) {
                cube ([ strap_width, lamp_radius, 4] );
            }
            // The hole for the connector
            translate ([ - lamp_radius -4 , - plug_width / 2 , 5]) {
                cube([8, plug_width, 6]);
            }
        }
        difference () {
            translate ([0,0,5]) {
                cylinder ( h=3 - 1.2, r=lamp_radius );
            }
            translate ([0,0,4.5]) {
                cylinder ( h=7, r=lamp_radius - 2 );
            }
            translate ([-lamp_radius,-plug_width/2,5]) {
                cube ([5,plug_width,3]);
            }
        }
    }
}

module lamp () {
    union () {
        cylinder (h=3, r=lamp_radius);
        translate ([lamp_radius - 5, - plug_width / 2   , 0]){
            cube ([10,plug_width,3]);
        }
    }
}

module top_clip () {
    intersection () {
        cylinder(h=2, r=lamp_radius + 2);
        translate ([lamp_radius -3 ,-15,0]) {
            cube ([6,30,3]);
        }
    }
}

module cable_clip () {
    union () {
        difference () {
            rotate ([0,90,0]) {
                cylinder (h=3,r=1.5);
            }
            translate ([-0.5,0, -4]) {
                cube ([4,4,4]);
            }
        }
        translate ([0,-1.5,-5]) {
            cube([3,1.5,5]);
        }
    }
}

module complete_lamp_holder () {
    difference () {
        union () {
            lamp_holder ();
            translate ([0,0,9]) {
                top_clip();
            }
            translate ([-(lamp_radius + 2), -plug_width / 2, 6+3]) {
                cable_clip ();
            }
            translate ([-(lamp_radius -1), plug_width / 2, 6+3]) {
                rotate([0,0,180]) {
                    cable_clip ();
                }
            }
        }
        translate ([-(lamp_radius + 3),plug_width / 2 + 1,6]) {
            cube ([5,1,4]);
        }
        translate ([-(lamp_radius + 3),-(plug_width / 2 + 2),6]) {
            cube ([5,1,4]);
        }
    }
}
translate ([0,0,6]) {
// lamp ();
}
complete_lamp_holder ();

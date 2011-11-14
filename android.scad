// Android model
// Copyright 2011 John Cooper

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

// You can adjust the size here
bodywidth = 40;
bodyheight = bodywidth * 1.7;
armwidth  = bodywidth / 4;
legwidth  = armwidth * 1.5;
standing  = true;

// You should not need to change anything after this

module antenna(length, width) {
    union () {
        cylinder(h=length, r1=width, r2=width);
        translate([0,0,length]) { sphere(width); }
    }
}

module head(body_r)  {
    $fs = 1;  // Crank up the resolution
    union () {
        difference () {
            sphere(body_r);
            translate ([-body_r, -body_r, -body_r * 2]) { cube(body_r * 2, body_r * 1, 1  );}
            sphere(body_r - 5);
        }
        difference () {
            translate ([0,0,-5]) {cylinder (h=10, r1=body_r -4, r2=body_r -4);}
            translate ([0,0,-5.5]) { cylinder (h=11, r1=body_r -7, r2=body_r -7);}
        }
    }
    // Now add the eyes
    translate ([-body_r * 0.3,-body_r * 0.8,body_r * 0.5]) {sphere (3);}
    translate ([body_r * 0.3,-body_r * 0.8,body_r * 0.5]) {sphere (3);}
    // And the antenna
    translate ([body_r * 0.6, 0, body_r * 0.75]) {antenna (7,2); }
    translate ([-body_r * 0.6, 0, body_r * 0.75]) {antenna (7,2); }

}

module body (body_r, bodyheight) {
    difference () {
        cylinder(h=bodyheight, r=body_r);
        translate ([0,0,5]) {
            cylinder(h=bodyheight, r=body_r - 5 );
        }
    }
}

module arm (arm_r, bodyheight) {
    union () {
        cylinder (h=bodyheight * 0.8, r=arm_r);
        translate ([0, 0, bodyheight * 0.8]) {
            sphere (arm_r);
        }
        sphere (arm_r);
        translate ([arm_r -3 , 0, bodyheight * 0.7]) {
            rotate ([0,90,0]) {
                cylinder (h=8,r=3);
            }
        }
    }
}

module leg ( leg_r, bodyheight, withfoot) {
    union () {
        cylinder (h=bodyheight / 2, r=leg_r );
        translate ([0, 0, bodyheight / 2]) {
            cylinder (h=8, r=3);
        }
        if (withfoot) {
            translate ([0, leg_r,0]) {
                rotate ([90, 0, 0]) {
                    cylinder (h=leg_r * 2.4, r=leg_r);
                }
            }
            translate ([0, - leg_r * 1.4,0]) {
                sphere( leg_r );
            }
        } else {
            sphere ( leg_r );
        }
    }
}



translate ([0,0,bodyheight*2]) {
    head (bodywidth);
    translate ([0,0,-(bodyheight + 3)]) {
      body (bodywidth, bodyheight);
    }
    translate ([-(bodywidth + armwidth + 3), 0,-bodyheight]) {
        arm(armwidth, bodyheight);
    }
    translate ([(bodywidth + armwidth + 3), 0,-bodyheight]) {
        rotate ([0,0,180], center=true) {
            arm(armwidth, bodyheight);
        }
    }
    if ( standing ) {
        translate ([ bodywidth * 0.4 , 0, - (bodyheight * 1.5 + 5)]) {
            leg(legwidth, bodyheight, withfoot=true);
        }
        translate ([ - bodywidth * 0.4, 0, - (bodyheight * 1.5 + 5)]) {
            leg(legwidth, bodyheight, withfoot=true);
        }

    }
}

// Android model
// Copyright 2011 John Cooper

// Licenced under Creative Commons Attribution 3.0 Unported (CC BY 3.0)
// https://creativecommons.org/licenses/by/3.0/deed.en

// Based on dimentions from the google Android.svg found here:
// https://secure.wikimedia.org/wikipedia/en/wiki/File:Android_robot.svg


// You can adjust the size here
bodywidth = 183.2;
bodyheight = bodywidth * 0.85; // 156
armwidth  = bodywidth * 0.26; // 40
armlength = bodyheight * 0.8; // 125 including the round bits;
legwidth  = armwidth ;
bodygap = bodywidth * 0.04;
leglength = bodyheight * 0.43; // 67
// headgap = 7.5;
// eye center from bottom of head = 40;
// between the eyes = 85
// antenna height = 25
// antenna width = 16
// antenna lenght = 29.6
// antenna angle  = 25
eye_height = bodywidth * 0.22;
eye_width  = bodywidth * 0.082 ; // 15.2
eye_sep    = bodywidth * 0.46 ; //  85
antenna_length = bodywidth * 0.161 ;
antenna_width = bodywidth * 0.02 ; // 3.6
antenna_angle = 25 ;
antenna_height = bodywidth * 0.404;// 74
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
    translate ([-eye_sep / 2 ,-body_r * 0.75,eye_height]) {sphere (eye_width / 2);}
    translate ([eye_sep / 2,-body_r * 0.75, eye_height]) {sphere (eye_width / 2);}
    // And the antenna
    translate ([body_r * 0.5, 0, antenna_height]) {
        rotate ([0,antenna_angle,0]) {
            antenna (antenna_length, antenna_width);
        }
    }
    translate ([-body_r * 0.5, 0, antenna_height]) {
        rotate ([0,-antenna_angle,0]) {
            antenna (antenna_length, antenna_width);
        }
    }

}

module body (body_r, bodyheight) {
    difference () {
        cylinder(h=bodyheight, r=body_r);
        translate ([0,0,5]) {
            cylinder(h=bodyheight, r=body_r - 5 );
        }
    }
}

module arm (arm_r, bodyheight, armlength) {
    union () {
        cylinder (h=armlength, r=arm_r);
        translate ([0, 0, armlength]) {
            sphere (arm_r);
        }
        sphere (arm_r);
        // And now a peg to hold them on
        translate ([arm_r - bodygap , 0, armlength]) {
            rotate ([0,90,0]) {
                cylinder (h=bodygap* 2, r=arm_r/4);
            }
        }
    }
}

module leg ( leg_r, bodyheight, leglength, withfoot) {
    union () {
        cylinder (h=leglength, r=leg_r );
        translate ([0, 0, leglength]) {
            cylinder (h=8, r=3);
        }
        if (withfoot) {
            difference () {
                union () {
                    translate ([0, leg_r,0]) {
                        rotate ([90, 0, 0]) {
                            cylinder (h=leg_r * 2.4, r=leg_r);
                        }
                    }
                    translate ([0, - leg_r * 1.4,0]) {
                        sphere( leg_r );
                    }
                }
                translate ([- ( leg_r + 0.5), -leg_r * 2.5, - leg_r]) {
                    cube ([leg_r * 2 + 1 , leg_r * 3.6, leg_r] );
                }
            }
        } else {
            sphere ( leg_r );
        }
    }
}



translate ([0,0,bodyheight*2]) {
    % head (bodywidth /2 );
    translate ([0,0,-(bodyheight + bodygap)]) {
    %  body (bodywidth / 2, bodyheight);
    }
    translate ([-(bodywidth/2 + armwidth/2 + bodygap), 0,-bodyheight]) {
        arm(armwidth/2, bodyheight, armlength);
    }
    translate ([(bodywidth/2 + armwidth/2 + bodygap), 0,-bodyheight]) {
        rotate ([0,0,180], center=true) {
            arm(armwidth/2, bodyheight, armlength);
        }
    }
    if ( standing ) {
        translate ([ bodywidth/ 2 * 0.4 , 0, - (bodyheight + leglength)]) {
            leg(legwidth/2, bodyheight, leglength, withfoot=true);
        }
        translate ([ - bodywidth / 2  * 0.4, 0, - (bodyheight + leglength)]) {
            leg(legwidth/2, bodyheight, leglength, withfoot=true);
        }

    }
}

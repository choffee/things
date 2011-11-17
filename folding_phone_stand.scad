// Folding phone stand
//
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


module arm () {
    difference () {
        union () {
            translate ([0, 2.5, 0]) {
                rotate ([0,0,-170]) {
                    difference () {
                        cube ([100,5,5]);
                        translate ([69,-1,-1]) {
                            cube ([17.5,7,7]);
                        }
                    }
                    translate ([68,4.5,-1]) {
                        rotate ([0,-10,0]) {
                            cylinder (h=7, r=4);
                        }
                    }
                }
                rotate ([0,0,170]) {
                    difference () {
                        cube ([100,5,5]);
                        translate ([68.5,-1,-1]) {
                            cube ([17.5,7,7]);
                        }
                    }
                    translate ([67,1.5,-1]) {
                        rotate ([0,-10,0]) {
                            cylinder (h=7, r=4);
                        }
                    }
                }
            }
            translate ([0, -2.5, 0]) {
                rotate ([0,0,-10]) {
                    cube ([60,5,5]);
                }
                rotate ([0,0,10]) {
                    cube ([60,5,5]);
                }
            }
            translate ([-14,-5,0]) {
                cube([28,10,5]);
            }
            translate ([-100,-25,0]) {
                cube ([5,50,5]);
            }
            translate ([50,-10,0]) {
                cube ([5,20,5]);
            }
            translate ([-90, -20, 0]) {
                cube ([5, 40, 5]);
            }
            translate ([-68, -15, 0]) {
                cube ([5, 28, 5]);
            }
            translate ([-100,-2.5,0]) {
                cube ([110,5,5]);
            }
        }
        translate ([-12,0,5]) {
            rotate ([0,20,0]) {
                cube ([40,8,6]);
            }
        }
        // Clean up the bottom of the panel
        translate ([-120,-50,-20]) {
            cube ( [200, 100, 20] );
        }
    }


}

arm();
// translate ([2,0,6]) {
// rotate ([180,20,0]) {
// arm();
//     }
// }
// rotate ([0,10,-5]) {
// translate ([-84,-4,-20]) {
//    % cube ( [13,300,50]);
// }
// }

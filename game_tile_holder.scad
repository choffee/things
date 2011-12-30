// A simple holder for game tiles

// Make the curves more curvey
$fs=0.2;

tileHeight=26;
tileWidth=19;
tileDepth=13;
tileNumber=7;

standWidth= tileWidth * ( tileNumber + 1 );

module holder (side) {
    dragon_x_r = ( side == "right" ) ? 3 : 0;
    dragon_x_l = ( side == "right" ) ? 17 : 20;
    difference () {
        union () {
            // Stand
            rotate ([55,0,0]) {
              difference () {
                  minkowski() {
                    cube ([standWidth, tileHeight, 3]);
                    cylinder(r=3, h=1);
                  }
                  // for right x = 3 and 17 for these two translates

                  translate ([dragon_x_r,18,3]) {
                    linear_extrude(file = "clipart/dragon-1275922881.dxf", 
                      height = 6, center = false, convexity = 10,  scale=0.3);
                  }
                  translate ([standWidth -dragon_x_l,18,3]) {
                    linear_extrude(file = "clipart/dragon-1275922881.dxf", 
                      height = 6, center = false, convexity = 10,  scale=0.3);
                  }
              }

            }
            // bottom
            translate([0, 1, 0]) {
                minkowski() {
                  cube ([standWidth, tileHeight * 0.8, 2]);
                  cylinder(r=3, h=1);
                }
            }
            // lip
            rotate ([145,0,0]) {
              difference () {
                  minkowski() {
                    cube ([standWidth, tileDepth * 0.8, 3]);
                    cylinder(r=3, h=1);
                  }
                  translate ([-4,13,12]) {
                      rotate ([0,90,0]) {
                        cylinder (h=standWidth * 1.2, r=10.5);
                      }
                  }
              }
            }
        }
        translate ([-4,-10,-10]) {
            cube ([standWidth + 8, tileHeight * 1.5, 10]);
        }
        // Stand arch
        difference () {
          translate ([standWidth * 0.5, standWidth * 0.42, -0.1]) {
            cylinder (r=standWidth * 0.5, h=3.15);
          }
          translate ([0, -13, -0.1]) {
            cube ([standWidth,15,5]);
          }
        }
    }
}

module rightHolder () {
    difference () {
        holder (side="right");
        // hole for clip
        translate ([2.4,10,0]) {
          cylinder ( r=4, h=4);
        }
        translate ([5,-20,0]) {
          rotate ([0,0,100]) {
            cube ([tileHeight * 2, 7, tileHeight * 1.1]);
          }
        }
    }

}
module leftHolder () {
    union () {
        difference () {
            holder (side="left");
            translate ([standWidth +2,-20,0]) {
              rotate ([0,0,80]) {
                cube ([tileHeight * 2, 7, tileHeight * 1.1]);
              }
            }
        }
        // peg for clip
        translate ([standWidth + 5.5 - 2.4,9,0]) {
           cylinder ( r=3.6, h=4);
        }
    }

}

module bothTogether () {
    // Show them both connected together
    translate ([standWidth-2.7,0.5,0]) {
      rotate ([0,0,-20]) {
        rightHolder ();
      }
    }
    leftHolder ();
}

module bothForPrint () {
    // Show them both next to each other for printing
    translate([0, tileHeight * 2, 0]) {
      rightHolder ();
    }
    leftHolder ();
}

bothForPrint();
// bothTogether();

// Nametage template for helen.
// 

$fs=0.2;

difference () {
    union () {
        translate ([11,7.5,0]){cube([5,2,3]);}
        translate ([22.1,6.9,0]){cube([5,2,3]);}
        translate ([34,7.5,0]){cube([3,2,3]);}
        translate ([44.6,6.9,0]){cube([4,2,3]);}

        // and the hat
        translate ([11.2,18.1,0]){
            rotate ([0,0,55]) {cube([5,2,3]);}
        }



        linear_extrude(file = "sarah.dxf", 
          height = 6, center = false, convexity = 10,  scale=1);
    }
    translate ([13.5,23.5,-0.1]){ cylinder(h=7,r=1);}
}

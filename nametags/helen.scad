// Nametage template for helen.
// 

$fs=0.2;

difference () {
    union () {
        translate ([17,8,0]){cube([5,2,3]);}
        translate ([26.1,6.3,0]){cube([5,2,3]);}
        translate ([34,6.3,0]){cube([3,2,3]);}
        translate ([42.5,6.3,0]){cube([4,2,3]);}

        // and the hat
        translate ([7.2,17.5,0]){cube([2,2,3]);}



        linear_extrude(file = "helen.dxf", 
          height = 6, center = false, convexity = 10,  scale=1);
    }
    translate ([8.5,21.5,-0.1]){ cylinder(h=7,r=1);}
}

// Nametage template for helen.
// 

$fs=0.2;

difference () {
    union () {
        translate ([10,3,0]){cube([5,3,3]);}
        translate ([18.5,3.2,0]){cube([5,3,3]);}
        translate ([29,2.5,0]){cube([5,3,3]);}
        translate ([39.9,3.1,0]){cube([4,3,3]);}

        // and the hat
        translate ([6.9,14.5,0]){cube([2,3,3]);}



        linear_extrude(file = "clare.dxf", 
          height = 7, center = false, convexity = 10,  scale=1);
    }
    translate ([7.5,19.5,-0.1]){ cylinder(h=8,r=1);}
}

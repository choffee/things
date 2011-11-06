screen=9;
wire=3.6;
out_r=((3.6/2)+3+0.5);
union () {
difference () {
    cylinder ( h=12, r1=8, r2=8 );
    translate ( [0,0,-0.5] ) {
        cylinder ( h=13, r1=5, r2=5 );
    }
    translate ([-8.2,0,-0.1]) {
        cube ([6,3,13]);
    }
}

translate ([-4,-10,0]) {
    difference () {
        cylinder ( h=12, r1=out_r, r2=out_r);
        translate( [0,0,-0.5]) {
            cylinder ( h=13, r1=out_r-3, r2=out_r-3);
        }
        translate ([0,-2.5,-0.1]) {
            cube ([ 6,3,13]);
        }
    }
}
}

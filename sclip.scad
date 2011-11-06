screen=9;
thickness=3;
s_inner=(screen * 0.9) / 2 ;
s_outer=s_inner + thickness;
wire=3.9;
w_inner=(wire * 0.9) /2;
w_outer=w_inner + thickness;
w_slot = wire * 0.7;
height=12;
out_r=((wire/2)+(thickness*1.1));
union () {
difference () {
    cylinder ( h=height, r1=s_outer, r2=s_outer );
    translate ( [0,0,-0.5] ) {
        cylinder ( h=height+1, r1=s_inner, r2=s_inner );
    }
    translate ([-s_inner * 2, 0, -0.1]) {
        cube ([screen * 0.8,thickness,height + 1]);
    }
}

translate ([-s_inner,-(s_outer + w_outer - thickness/1.5),0]) {
    difference () {
        cylinder ( h=height, r1=w_outer, r2=w_outer);
        translate( [0,0,-0.5]) {
            cylinder ( h=height+1, r1=w_inner, r2=w_inner);
        }
        translate ([w_inner * 0.5, -(w_slot /  2 ), -0.1]) {
            cube ([thickness * 1.3 ,w_slot, height+1]);
        }
    }
}
}

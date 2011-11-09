screen=10;
thickness=3;
s_inner=screen ;
s_outer=s_inner + thickness;
wire=3.5  + 1;
w_inner=wire  / 2;
w_outer=w_inner + thickness;
w_slot = wire * 0.7;
height=12;
out_r=((wire/2)+(thickness*1.1));
union () {
difference () {
    // Larger loop
    cylinder ( h=height, r1=s_outer, r2=s_outer );
    translate ( [0,0,-0.5] ) {
        cylinder ( h=height+1, r1=s_inner, r2=s_inner );
    }
    translate ([-(s_inner+thickness),0, -0.1]) {
        cube ([thickness * 3, screen * 0.8, height + 1]);
    }
}
translate ([-(s_inner + thickness ) ,0,0]){
    cylinder ( h=height, r1=thickness, r2=thickness);
}
translate ([-(sqrt(((s_inner + thickness) * (s_inner + thickness)) - (screen * 1 * screen * 1) )) ,screen * 1,0]){
    cylinder ( h=height, r1=thickness, r2=thickness);
}

translate ([-(s_inner - thickness),-(s_inner+ w_outer ),0]) {
    // Smaller Loop
    difference () {
        cylinder ( h=height, r1=w_outer, r2=w_outer);
        translate( [0,0,-0.5]) {
            cylinder ( h=height+1, r1=w_inner, r2=w_inner);
        }
        translate ([w_inner * 0.5, -(w_slot /  2 ), -0.1]) {
            cube ([thickness * 2 ,w_slot, height+1]);
        }
    }
}
}

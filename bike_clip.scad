width=20;
depth=5;
bar_r=10;
length=50;

difference () { 
union () {
  translate ([0, 0, -( length / 2 ) ] ) {cube ( [width,depth, length] );}
  intersection () {
    translate ([0, 0, - (bar_r + depth) ] ) {
      cube ( [width, bar_r + depth, (bar_r + depth) * 2] );
    }
    rotate( a=[90, 0, 90]) { cylinder( h=width, r1=bar_r + depth, r2=bar_r + depth);}
  }
}
rotate(a=[90, 0, 90]) { cylinder( h=width, r1=bar_r, r2=bar_r); }
}
// That part for Prit's car vent.

$fs=0.2;

module oblong(len,width,height) {
  union() {
    cube([len - (width), width, height]);
    for ( l = [0, 1] ) {
      translate([l * (len - (width)), width/2, 0]) {
        cylinder(r=width/2, h=height);
      }
    }
  }
}

top_len=110;
top_width=20;
inner_len=100;
inner_width=10;
inner_height=14;
inner_thickness=2;

difference() {
  union() {
    difference() {
      oblong(top_len, top_width, 2);
      translate([0, top_width/2, top_width]) {
        rotate([0,90,0]) {
          cylinder(r=20, h=inner_len - inner_width);
        }
      }
      for ( l = [0, 1] ) {
        translate([l * (inner_len - top_width/2),top_width/2,top_width ]) {
          sphere(r=top_width);
        }
      }
    }
    translate ([0,(top_width - inner_width)/2,0]) {
      oblong(inner_len, inner_width, inner_height);
    }
  }
  translate([0, (top_width - inner_width + inner_thickness)/2, -0.5]) {
    oblong(inner_len - inner_thickness, inner_width - inner_thickness, inner_height+1);
  }
}

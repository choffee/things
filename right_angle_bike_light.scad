//  Right angle bike light holder

bar_diameter = 23;
bar_radius = bar_diameter / 2;
clamp_width = 35;
cover_thickness = 7;
outer_cover_radius = bar_radius + ( cover_thickness / 2 );
cover_length = bar_diameter + 30;
tiewrap_width=5;
tiewrap_depth=1.7;

module tube (length, outer_r, inner_r) {
    difference () {
        cylinder (h=length, r1=outer_r, r2=outer_r);
        translate ([-0.5,0,0]) {
            cylinder (h=length + 1, r1=inner_r, r2=inner_r);
        }
    }
}

translate ( [0,0,bar_radius]) {
union () {
difference () {
    union () {
        cylinder (h=clamp_width,r1=bar_radius,r2=bar_radius);
        translate ([0,0,clamp_width]){
            cylinder (h=5, r1=bar_radius, r2=bar_radius + 3);
        }
    }
    translate ([0,0,clamp_width]) {
        cylinder (h=6, r1=1, r2=bar_radius - 1);
    }
}

difference () {
    union () {
        cylinder(h=cover_thickness,r1=outer_cover_radius, r2=bar_radius );
        translate ([0,0,-bar_radius]) {
            cylinder(h=bar_radius,r1=outer_cover_radius, r2=outer_cover_radius);
        }

        translate ([- cover_length /2, 0, -bar_radius]) {
            rotate ([0,90,0]) {
                 cylinder (h=cover_length, r1=outer_cover_radius, r2=outer_cover_radius);
            }
        }
    }
    translate ([- cover_length / 2 -0.5, 0, -bar_radius]) {
        rotate ([0,90,0]) {
            cylinder(h=cover_length+1, r1=bar_radius, r2=bar_radius);
        }
    }
    translate ([-cover_length/2 - 0.5,-outer_cover_radius, -(outer_cover_radius * 2 - cover_thickness / 2 )]) {
        cube ([cover_length+1, outer_cover_radius * 2, outer_cover_radius]);
    }
    translate ([cover_length/2 - tiewrap_width * 2  ,0, -bar_radius]) {
        rotate([0,90,0]) {
            tube(length=tiewrap_width, inner_r=outer_cover_radius - tiewrap_depth, outer_r=outer_cover_radius + 1);
        }
    }
    translate ([-(cover_length / 2 - tiewrap_width ) ,0, -bar_radius]) {
        rotate([0,90,0]) {
            tube(length=tiewrap_width, inner_r=outer_cover_radius - tiewrap_depth, outer_r=outer_cover_radius + 1);
        }
    }
}
}
}

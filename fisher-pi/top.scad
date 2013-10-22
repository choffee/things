// A top plate for the fisher-pi

$width=124.6;
$depth=43.5;
$height=2;

$lcdwidth=92.5;
$lcddepth=32.45;

$ledd=4.4 + 1;
$switchd=3.3 + 2;

$lcdtoled=19.3;
$lcdtoswitch=26.1;

module hole(d) {
  translate([0, 0, -0.5]){
    cylinder(r=(d / 2), h=$height + 100);
  }
}

module led() {
  hole(d=$ledd);
}

module switch() {
  hole(d=$switchd);
}

module switches() {
  for (l = [0, 1, 2, 3]) {
    translate([0, (6 * l), 0]){
      switch();
    }
  }
}

module leds() {
  for (l = [0, 1, 2]) {
    translate([0, (6.8 * l), 0]){
      led();
    }
  }
}

module base (){
  cube([$width, $depth, $height]);
}

module lcd() {
  translate([-0.1, -0.1, -0.5]){
    cube([$lcdwidth, $lcddepth, $height + 1]);
  }
}

module hump() {
  translate([$lcdwidth+ $lcdtoswitch, $depth, 0]) {
    rotate([90, 0, 0]) {
      cylinder(h=$depth, r=5);
    }
  }
}


module main() {
  difference() {
    union() {
      base();
      hump();
      translate([(- ($lcdtoswitch - $lcdtoled)), 0, 0]) {
        hump();
      }
    }
    translate([($lcdwidth + $lcdtoswitch), 6.5, 0]){
      switches();
    }
    translate([($lcdwidth + $lcdtoled), 13, 0]){
      leds();
    }
    lcd();
    // Cut out for trimmer cap
    translate([($lcdwidth + $lcdtoled -3), 1, -0.1]){
      #cube([6, 7, 3]);
    }
    // Clean the base
    translate([-5, -5, -10]) {
      cube([200,200,10]);
    }
  }

}

main();

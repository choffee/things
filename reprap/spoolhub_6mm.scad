// Just an hack to make up a spool hub that hooks over some 6mm MDF.

difference () {
  union () {
    import_stl("SpoolHub.stl", convexity = 5);
    translate ([-30.0, 41, 0]) {
      cube ([20, 6, 9]);
    }
  }
  translate ([-35.3, 35, -1]) {
    cube([20, 6, 11]);
  }
}

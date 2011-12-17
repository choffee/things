
// Based on an openclipart.org image
// http://openclipart.org/detail/2782/moose-sihouette-by-johnny_automatic

// To convert from the svg to dxf
// inkscape -E intermediate.eps moose.svg
// pstoedit -dt -f dxf:-polyaslines intermediate.eps moose.dxf


linear_extrude(file = "moose.dxf", 
  height = 4, center = false, convexity = 10, twist = -fanrot, scale=15);

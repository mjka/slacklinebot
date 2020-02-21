include <mjk.scad>

$fn=20;
d = 7;
r = 7;


difference() 
{
  tz(d/3) union() {
    rotate_extrude(angle=180) tx(r) circle(d=d);
    tx(-r) sphere(d=d);
    tx(r) rotx() hull() { cylinder(d=d, h=2*d); tz(9) ty(2*d) cylinder(d=d, h=1); }
  }
  tz(-20) cube(40, true);
}
x = 2*d+r;
tx(-x/2) ty(-2*d) difference() 
{ 
  cube([x, 4, x]);
  tx(x/3) tz(x/2) rotx(-90) cylinder(d1=3, d2=10, h=5);
}

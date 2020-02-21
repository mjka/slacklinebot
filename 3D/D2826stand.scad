include <mjk.scad>

$fs=0.1;

{
cubexy([50,40,6]);
tz(30) ty(20) rotx() Stator();
}


tx(50) difference()
{
  N=12;
  cylinder(h=3, d=40);
  
  render() for(a=[0:360/N:360]) rotz(a) tz(-1) intersection() { tx(8) cube(10); rotz(180/N) my() tx(8) cube(10);}
  cylinder(d=3.3, h=10);
}


module Stator()
{
intersection()
{
  cylinder(h=10, d=28);
  for (a=[0:90:200]) rotz(90+a) tx(8+9) cylinder(d=18, h=6);
}
difference()
{
  ty(-5) cubexy([35,40,5]); 
  for (a=[45:90:360]) rotz(a) tx(9) tz(-1) cylinder(d=4, h=10);
  tx(14) tz(2) cubexy([11,12,10]);
}
}


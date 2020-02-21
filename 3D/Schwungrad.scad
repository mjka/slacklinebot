include <mjk.scad>



D=40;
H=10;

difference()
{
  cylinder(d=D, h=H, $fn=200);
  cylinder(d=2, h=H+2, $fn=20);
}

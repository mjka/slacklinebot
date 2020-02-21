include <mjk.scad>

DIM=[100, 200, 15];

intersection()
{
  cmx()union()
  {
     difference()
    { cube([DIM.x/2, DIM.z/2, DIM.z]);
      tz(DIM.z/2) tx(DIM.x/2-DIM.z/2) rotx(-90) cylinder(d1=4, d2=DIM.z, h=DIM.z/2+1);
    }
    difference()
    {
      tx(DIM.x/2-1.4*DIM.z) rotz(9) cube([DIM.z/2, DIM.y, DIM.z]);
      ty(DIM.y-4) cylinder(d=9, h=DIM.z+2);
    }
  }
   union() {
    ty(DIM.z/2) tx(-DIM.x/2) cube(DIM);
    ty(DIM.z/2*1.5) tz(DIM.z/2) roty() cylinder(d=DIM.z*1.5, h=DIM.x, center=true);
  }
}
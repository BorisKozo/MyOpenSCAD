$fn=100;

include <threads.scad>
use <boxes.scad>

cylinder(h=9.5,r1=9.5,r2=8.5);

translate([8.5,-1.5/2,0])
  cube([2.5,1.5,9.5]);
  
translate([-8.5-2.5,0,0])
  cube([2.5,1.5,9.5]);  
  
  
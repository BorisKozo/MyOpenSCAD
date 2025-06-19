include <MCAD/boxes.scad>
$fn=100;
difference(){
   roundedBox(size = [33,21,2] , radius = 3, sidesonly = 1);
   translate([12,5,-1])
     cylinder(d=3.3,h=2);
   translate([-12,5,-1])
     cylinder(d=3.3,h=2);
 
}
include <MCAD/boxes.scad>
use <util.scad>

$fn = 100;

PINS_HOLDER_DIAMETER = 2.2;


SNUGNESS = 0.5;

module bearingHole(height){
    difference(){
         hull(){
         cylinder(d=10-SNUGNESS, h=height);
       
         translate([10+coreDiameter(),0,0])  
           cylinder(d=10-SNUGNESS, h=height);
       }
       translate([-2,-1,0])
       cube([14+coreDiameter(),2.5,3.5]);
   }
}
rotate([0,180,0]){

//Body    
translate([padlockWidth()/2,padlockDepth()/2,1])  
  roundedBox([padlockWidth(),padlockDepth(),2],radius = 2, sidesonly = 1);
  
SHACKLE_CAVITY_HEIGHT_START = 10-coreDiameter()/2+1;
PADLOCK_TOP = padlockHeight()-5;

SHACKLE_CAVITY_HEIGHT = PADLOCK_TOP-SHACKLE_CAVITY_HEIGHT_START-10-0.5;

translate([4+SNUGNESS/2,4+25+6+SNUGNESS,-SHACKLE_CAVITY_HEIGHT])  
  cube([10-SNUGNESS,18-SNUGNESS,SHACKLE_CAVITY_HEIGHT]);  

translate([4+10+6+coreDiameter()+6+SNUGNESS/2,3+SNUGNESS,-SHACKLE_CAVITY_HEIGHT])
  difference(){
    cube([10-SNUGNESS,18+29+3-SNUGNESS,SHACKLE_CAVITY_HEIGHT]);
    translate([8,2+25+6-SNUGNESS,0])  
      space(SNUGNESS)
        cube([2,2,SHACKLE_CAVITY_HEIGHT]);  
}

translate([4+10+1,4+25+6+3+5,-SHACKLE_CAVITY_HEIGHT])
  bearingHole(SHACKLE_CAVITY_HEIGHT);


translate([6,10,-2]) 
      cube([10,20,1.8]);  
}
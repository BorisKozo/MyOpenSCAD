include <MCAD/boxes.scad>
use <util.scad>

$fn = 100;

PINS_HOLDER_DIAMETER = 2.2;


SNUGNESS = 0.5;

module bearingHole(height){
     hull(){
     cylinder(d=10-SNUGNESS, h=height);
   
     translate([10+coreDiameter(),0,0])  
       cylinder(d=10-SNUGNESS, h=height);
   }
}
rotate([0,180,0]){
translate([padlockWidth()/2,padlockDepth()/2,5/2])  
  roundedBox([padlockWidth(),padlockDepth(),5],radius = 2, sidesonly = 1);
  
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

translate([4+10+6+coreDiameter()/2+SNUGNESS/2,4+25+3+SNUGNESS/2,-1])
      cube([coreDiameter()/2+3,4,0.8]);

translate([6,10,-2]) 
      cube([10,20,1.8]);  
}
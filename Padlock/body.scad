include <MCAD/boxes.scad>
use <util.scad>

$fn = 100;

PINS_HOLDER_DIAMETER = 2.2;


SNUGNESS = 0.25;

module bearingHole(){
  space(SNUGNESS)  
    hull(){
     cylinder(d=10, h=padlockHeight());
   
     translate([10+coreDiameter(),0,0])  
       cylinder(d=10, h=padlockHeight());
   }
}

difference(){
  translate([padlockWidth()/2,padlockDepth()/2,(padlockHeight()-5)/2])  
    roundedBox([padlockWidth(),padlockDepth(),padlockHeight()-5],radius = 2, sidesonly = 1);
  
  //Pin holder  
  translate([3+PINS_HOLDER_DIAMETER/2,0,10])
    rotate([-90,0,0])
      cylinder(d=PINS_HOLDER_DIAMETER, h=30);  
  
  //Core lip
  translate([20+6.3,0,10])
    rotate([-90,0,0])
      space(2*SNUGNESS)
        cylinder(d=14.6, h=2);  
  
  //Core  
  translate([20+coreDiameter()/2,2,10])
    rotate([-90,0,0])
      space(2*SNUGNESS)
        cylinder(d=12.6, h=(2+25+6+15));    
    
  //bearing
  translate([4+10+1,4+25+6+3+5,10-coreDiameter()/2+1])
    bearingHole();
    
  //Left shackle cutout  
  translate([4,4+25+6,10-coreDiameter()/2+1])
    space(SNUGNESS)
      cube([10,18,padlockHeight()]);  

  //Right shackle cutout
  translate([4+10+6+coreDiameter()+6,3,10-coreDiameter()/2+1])
    difference(){
      space(SNUGNESS)
        cube([10,18+29+5,padlockHeight()]);
      translate([8,2+25+6,0])  
        space(SNUGNESS)
          cube([2,2,padlockHeight()]);  
    }
  
  // Pin 1  
  translate([0,pin1Depth(),10])
    pinHole(4+10+6+coreDiameter()/2);  
    
  // Pin 2  
  translate([0,pin2Depth(),10])
    pinHole(4+10+6+coreDiameter()/2);    

  // Pin 3  
  translate([0,pin3Depth(),10])
    pinHole(4+10+6+coreDiameter()/2);    

  // Pin 4  
  translate([0,pin4Depth(),10])
    pinHole(4+10+6+coreDiameter()/2);    

  // Pin 5  
  translate([0,pin5Depth(),10])
    pinHole(4+10+6+coreDiameter()/2);    

  //Retainer cutout
  translate([4+10+6+coreDiameter()/2,4+25+3,10-coreDiameter()/2-2])
    space(2*SNUGNESS)
      cube([coreDiameter()/2+3,4,coreDiameter()+5]);

 //Alignment hole
  translate([6,10, padlockHeight()-5-2]) 
    space(2*SNUGNESS)
      cube([10,20,2]);  
       
  }
//difference(){
//  translate([4+10+6+coreDiameter()/2,4+25+4-1.5,10-coreDiameter()/2-2])
//      cube([coreDiameter()/2+3,3.5,padlockHeight()-4]);
//  cylinder(d=coreDiameter(),h=3.5);  
//} 


   
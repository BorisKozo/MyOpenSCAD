$fn=10;
CORE_HEIGHT = 15+6+25+2;
LIP_HEIGHT = 2;
SNUGNESS = 0.2;

use <key.scad>
use <bearing.scad>
use <util.scad>



module core(){
    cylinder(d=coreLipDiameter(),h=LIP_HEIGHT,center=false); //The lip
    translate([0,0,LIP_HEIGHT])
      cylinder(d=coreDiameter(),h=CORE_HEIGHT,center=false); //The lip
}

module cutCore(){
    PIN_LENGTH = -11.2;
    difference(){
      core();

      translate([PIN_LENGTH,0,pin1Depth()]) //pin 1
        pinHole(10);  

      translate([PIN_LENGTH,0,pin2Depth()]) //pin 2
        pinHole(10);  

      translate([PIN_LENGTH,0,pin3Depth()]) //pin 3
        pinHole(10);  

      translate([PIN_LENGTH,0,pin4Depth()]) //pin 4
        pinHole(10);  

      translate([PIN_LENGTH,0,pin5Depth()]) //pin 5
        pinHole(10);  
        
      translate([PIN_LENGTH,0,pin6Depth()]) //pin 6
        pinHole(10);  
  

      translate([-6,coreDiameter()/2+1,4+25+6+3+5])  //Left bearing
        rotate([0,90,0])
          space(SNUGNESS)  
            bearing();

      translate([-6,-coreDiameter()/2-1,4+25+6+3+5]) //Right bearing
        rotate([0,90,0])
          space(SNUGNESS)  
            bearing();


      rotate([0,0,-90]) //Key shaft
        translate([-2,1,0])
          space(2*SNUGNESS)  
            keyShaft(4+25+2);  
    
    }
}

cutCore();
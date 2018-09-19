$fn=10;
CORE_HEIGHT = 16+3+25+2;
LIP_HEIGHT = 2;
CORE_DIAMETER = 12.6;
SNUGNESS = 0.2;

use <key.scad>
use <bearing.scad>
use <util.scad>



module core(){
    cylinder(d=CORE_DIAMETER+2,h=LIP_HEIGHT,center=false); //The lip
    translate([0,0,LIP_HEIGHT])
      cylinder(d=CORE_DIAMETER,h=CORE_HEIGHT,center=false); //The lip
}

module cutCore(){
    difference(){
      core();

      translate([-10,0,7.5]) //pin 1
        pinHole(10);  

      translate([-10,0,12.5]) //pin 2
        pinHole(10);  

      translate([-10,0,17.5]) //pin 3
        pinHole(10);  

      translate([-10,0,22.5]) //pin 4
        pinHole(10);  

      translate([-10,0,27.5]) //pin 5
        pinHole(10);  

      translate([-6,CORE_DIAMETER/2+1,4+25+3+3+5])
        rotate([0,90,0])
          bearing();

      translate([-6,-CORE_DIAMETER/2-1,4+25+3+3+5])
        rotate([0,90,0])
          bearing();

      rotate([0,0,-90])
        translate([-1,-3,0])
          space(SNUGNESS)  
            keyShaft(CORE_HEIGHT+LIP_HEIGHT);  
    }
    
    
}

cutCore();


//    translate([-10.5,0,0])
//      pinHole(10);
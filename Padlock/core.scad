$fn=100;
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
    PIN_DEPTH = -9.7;
    difference(){
      core();

      translate([PIN_DEPTH,0,7.5]) //pin 1
        pinHole(10);  

      translate([PIN_DEPTH,0,12.5]) //pin 2
        pinHole(10);  

      translate([PIN_DEPTH,0,17.5]) //pin 3
        pinHole(10);  

      translate([PIN_DEPTH,0,22.5]) //pin 4
        pinHole(10);  

      translate([PIN_DEPTH,0,27.5]) //pin 5
        pinHole(10);  

      translate([-6,CORE_DIAMETER/2+1,4+25+3+3+5])  //Left bearing
        rotate([0,90,0])
          space(SNUGNESS)  
            bearing();

      translate([-6,-CORE_DIAMETER/2-1,4+25+3+3+5]) //Right bearing
        rotate([0,90,0])
          space(SNUGNESS)  
            bearing();

      rotate([90,0,60])
        translate([0,4+25+4,CORE_DIAMETER/2-8])
          cylinder(d=2,h=8);


      rotate([0,0,-90])
        translate([-1,-3,0])
          space(3*SNUGNESS)  
            keyShaft(4+25+2.5);  
    }
    
    
}

cutCore();

//    translate([-10.5,0,0])
//      pinHole(10);
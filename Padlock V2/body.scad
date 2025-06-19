include <MCAD/boxes.scad>
use <util.scad>

$fn = 10;

PINS_HOLDER_DIAMETER = 2.2;


SNUGNESS = 0.25;

difference(){
  translate([padlockWidth()/2,padlockDepth()/2,(padlockHeight()-5)/2])  
    roundedBox([padlockWidth(),padlockDepth(),padlockHeight()-5],radius = 2, sidesonly = 1);
  
  //Pin holder  
  translate([3+PINS_HOLDER_DIAMETER/2,0,10])
    rotate([-90,0,0])
      cylinder(d=PINS_HOLDER_DIAMETER, h=36);  
  
  //Core lip
  translate([3+8+8+coreDiameter()/2,0,10])
    rotate([-90,0,0])
      space(2*SNUGNESS)
        cylinder(d=14.6, h=2);  
  
  //Core  
  translate([3+8+8+coreDiameter()/2,2,10])
    rotate([-90,0,0])
      space(2*SNUGNESS)
        cylinder(d=12.6, h=(2+30+6+15));    
    
    
  //Left shackle cutout  
  translate([3,4+30+6,10-coreDiameter()/2+1])
    space(SNUGNESS)
      cube([8,18,10.5]);  

  //Right shackle cutout
  translate([3+8+8+coreDiameter()+3,4+30+6,10-coreDiameter()/2+1])
      space(SNUGNESS)
        cube([10,18,10.5]);
  
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
    
  // Retainer Pin
  translate([0,pin6Depth(),10])
    pinHole(4+10+6+coreDiameter()/2);         
  
  //Bearing hole
  translate([3+8+1,0,0])
    cube([7,10,10.5]);

translate([-10,-1,10])
  cube([100,100,10]);  
}

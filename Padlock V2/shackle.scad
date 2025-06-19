use <MCAD/2DShapes.scad>
use <util.scad>
use <bearing.scad>

$fn=100;

SNUGNESS = 0.4;
SHACKLE_WIDTH=8-2*SNUGNESS;
INNER_RADIUS = (6+6+coreDiameter())/2+SNUGNESS;
OUTER_RADIUS = INNER_RADIUS + SHACKLE_WIDTH;

module shackleBow(height){
  linear_extrude(height = height){  
    donutSlice(INNER_RADIUS,OUTER_RADIUS,0,180);
  }
}

module leftShackle(height, length){
  fullLength = length+18;  
  translate([-OUTER_RADIUS,-fullLength,0]){  
    difference(){  
      linear_extrude(height = height){  
        square([SHACKLE_WIDTH,fullLength]);
      }
      translate([8,8,-1])
        space(SNUGNESS)
          cylinder(d=bearingOuterDiameter(),h=15); 
    }
  }
}

module rightShackle(height, length){
  fullLength = length+18;  
  translate([OUTER_RADIUS-SHACKLE_WIDTH,-fullLength,0]){  
    difference(){  
      linear_extrude(height = height){  
        square([SHACKLE_WIDTH,fullLength]);
      }
//      translate([-1,8,-1])
//        space(SNUGNESS)
//          cylinder(d=bearingOuterDiameter(),h=15); 
    }
  }
}


shackleBow(10);
leftShackle(10,15);
rightShackle(10,15);

use <MCAD/2DShapes.scad>
use <util.scad>
use <bearing.scad>

$fn=100;

SNUGNESS = 0.4;
SHACKLE_WIDTH=10-2*SNUGNESS;
INNER_RADIUS = (6+6+coreDiameter())/2+SNUGNESS;
OUTER_RADIUS = INNER_RADIUS + SHACKLE_WIDTH;
CATCH_LENGTH = 32;

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
      translate([11,8,0])
        space(SNUGNESS)
         cylinder(d=9.5,h=20);
    }
  }
}

module rightSchackleArm(height, length, fullLength){

  translate([0,-CATCH_LENGTH,0])  
  linear_extrude(height = height){  
    square([SHACKLE_WIDTH,fullLength+CATCH_LENGTH]);
  }
}


module rightShackle(height, length){
  fullLength = length+18;
  
  translate([INNER_RADIUS,-fullLength,0]){  
    difference(){
      rightSchackleArm(height, length, fullLength);
      translate([-1,8,-1])
        space(SNUGNESS)
         cylinder(d=9.5,h=20);
      translate([7,-CATCH_LENGTH+2,0])
        space(SNUGNESS)
          linear_extrude(height = height){  
            square([4,CATCH_LENGTH]);
         }
    }
  }
}


shackleBow(10);
leftShackle(10,15);
rightShackle(10,15);

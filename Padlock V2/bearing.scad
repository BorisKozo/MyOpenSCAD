function bearingOuterDiameter() = 8; //The diameter of the circle facing the shackle
function bearingInnerDiameter() = 10; //The diameter of the circle facing the core


$fn=100;

height = 10;

module bearing(){

  difference(){
    cylinder(d=bearingOuterDiameter(),h=height);
    translate([0,-bearingOuterDiameter()/2,0])
      cube([bearingOuterDiameter(),bearingOuterDiameter(),height]);
  }
  
  translate([0,-bearingInnerDiameter()/2,0])
    cube([2,bearingInnerDiameter(),height]);
  translate([1,0,0])
    difference(){  
       cylinder(d=bearingInnerDiameter(),h=height);
       translate([-bearingInnerDiameter(),-bearingInnerDiameter()/2,0])
         cube([bearingInnerDiameter(),bearingInnerDiameter(),height]);
    }

}

bearing();

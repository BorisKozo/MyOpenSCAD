use <util.scad>

$fn=100;



difference(){
  cube([coreDiameter()/2+3,3.95,coreDiameter()+4]);

  translate([0,4,coreDiameter()/2+2])
    rotate([90,0,0]){
      cylinder(d1=coreDiameter(), d2=coreDiameter()-3,h=4.1);  
  }  
  
  translate([-3,0,-(coreDiameter()+4)/2])
    cube([coreDiameter()/2+3,3.95,coreDiameter()+4]);
}




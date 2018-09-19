$fn=100;
CORE_HEIGHT = 16+3+25+2;
LIP_HEIGHT = 2;

module pinHole(length){
    rotate([0,90,0]){
      cylinder(d=3,h=length,center=false); //The lip
      translate([0,0,length])
        sphere(d=3);  
    }
}

module core(){
    cylinder(d=14.6,h=LIP_HEIGHT,center=false); //The lip
    translate([0,0,LIP_HEIGHT])
      cylinder(d=12.6,h=CORE_HEIGHT,center=false); //The lip
}

module cutCore(){
    difference(){
      core();
    }
}

cutCore();
//pinHole(10);
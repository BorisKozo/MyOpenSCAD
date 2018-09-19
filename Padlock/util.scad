module space(size){
  minkowski() {
	children(0);
	cube(size, center=true);
    //sphere(size, center=true,$fn=30);  
  }
}

module pinHole(length){
    PIN_DIAMETER = 3.2;
    rotate([0,90,0]){
      cylinder(d=PIN_DIAMETER,h=length,center=false); //The lip
      translate([0,0,length])
        sphere(d=PIN_DIAMETER);  
    }
}


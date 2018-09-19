module space(size){
  minkowski() {
	children(0);
	cube(size, center=true);
    //sphere(size, center=true,$fn=30);  
  }
}

module pinHole(length){
    rotate([0,90,0]){
      cylinder(d=3,h=length,center=false); //The lip
      translate([0,0,length])
        sphere(d=3);  
    }
}


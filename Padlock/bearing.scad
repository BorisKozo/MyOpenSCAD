BEARING_SIZE = 10-0.2;

module bearing(){
  cylinder(d=BEARING_SIZE,h=10,$fn=100);
}

bearing();
translate([1,-1,10])
  cube([4,2,3]);

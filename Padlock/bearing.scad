BEARING_SIZE = 10;

module bearing(){
  cylinder(d=BEARING_SIZE-0.5,h=10,$fn=100);
}

bearing();
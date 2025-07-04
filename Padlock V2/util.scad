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

function coreDiameter() = 12.6;

function coreLipDiameter() = coreDiameter()+2;

function padlockWidth() = 3+8+8+12.6+3+3;

function padlockDepth() = 4+5+5+5+5+5+5+6+18;

function padlockHeight() = 24;

function pin1Depth() = 7.5;
function pin2Depth() = 12.5;
function pin3Depth() = 17.5;
function pin4Depth() = 22.5;
function pin5Depth() = 27.5;
function pin6Depth() = 32.5;
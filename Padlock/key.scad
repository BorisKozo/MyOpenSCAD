SHAFT_LENGTH = 28;
BOW_FLAT = 9;

module keyShaftEnd(length){
    difference(){
      keyShaft(length);
      translate([-0.1,0,length-3])
        rotate([35,0,0])
          cube([1.7,10,10]);

    }
}

module keyShaft(length){
    linear_extrude(height=length)
      polygon([[0,0],[0,6],[1,6],[1,4],[1.5,4],[1.5,0]]);
}

module keyBow(){
  linear_extrude(height=1.5)  
      difference(){
        circle(d=20,$fn=100); 
        translate([-10,BOW_FLAT,0])  
          square([20,10]);
        translate([0,-5,0])    
          circle(d=5,$fn=100);  
      }
}

module key(){
   translate([-3,BOW_FLAT,0]) 
     rotate([-90,-90,0])
       keyShaft(SHAFT_LENGTH);
   translate([-3,BOW_FLAT+SHAFT_LENGTH-0.01,0]) 
     rotate([-90,-90,0])
       keyShaftEnd(4); 
   keyBow();    
}

key();
SHAFT_LENGTH = 28;
BOW_FLAT = 9;
KEY_HEIGHT = 3;

module keyShaftEnd(length){
    difference(){
      keyShaft(length);
      translate([-5,-5,length-4])
        rotate([35,0,0])
          cube([15,10,10]);
     
    }

}

module keyShaft(length){
    linear_extrude(height=length)
      polygon([[-0.5,0],[-0.5,KEY_HEIGHT],[4.5,KEY_HEIGHT],[4.5,0],[2.8,0],[2.8,-3.5],[1.2,-3.5],[1.2,0]]);
}

module keyBow(){
  linear_extrude(height=KEY_HEIGHT)  
      difference(){
        circle(d=20,$fn=100); 
        translate([-10,BOW_FLAT,0])  
          square([20,10]);
        translate([0,-5,0])    
          circle(d=5,$fn=100);  
      }
}

module key(){
   translate([-2,BOW_FLAT,KEY_HEIGHT]) 
     rotate([-90,0,0])
       keyShaft(SHAFT_LENGTH);
   translate([-2,BOW_FLAT+SHAFT_LENGTH-0.01,KEY_HEIGHT]) 
     rotate([-90,0,0])
       keyShaftEnd(4); 
   keyBow();    
}

key();

//keyShaftEnd(10);
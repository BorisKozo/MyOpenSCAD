$fn=100;

use <MCAD/threads.scad>

module shape(){
cylinder(h=9.5,d1=9.5,d2=8.5);

translate([8.5/2-0.1,-1.5/2,0])
  cube([2.5,1.5,9.5]);
  
translate([-8.5/2-2.5+0.1,-1.5/2,0])
  cube([2.5,1.5,9.5]);  

}  

//translate([15,0,0])
difference(){
  shape();
  //cylinder(h=9.5,d1=5.6,d2=5.6);  
  mirror([1,1,0])
    english_thread(diameter=0.29, internal=true,threads_per_inch=20,thread_size=1.2);
}


//english_thread(diameter=0.30, internal=true,threads_per_inch=15,thread_size=1);



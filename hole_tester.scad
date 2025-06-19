//difference(){
//  cube([26,6,5], center=true);
//    translate([-11,0,-5])
//      cylinder (h = 10, d=1.6, center = false, $fn=100);  
//    translate([-8,0,-5])
//      cylinder (h = 10, d=1.7, center = false, $fn=100);  
//    translate([-5,0,-5])
//      cylinder (h = 10, d=1.8, center = false, $fn=100);  
//    translate([-1.5,0,-5])
//      cylinder (h = 10, d=1.9, center = false, $fn=100);  
//    translate([2,0,-5])
//      cylinder (h = 10, d=2, center = false, $fn=100);  
//    translate([6,0,-5])
//      cylinder (h = 10, d=2.1, center = false, $fn=100);  
//    translate([10,0,-5])
//      cylinder (h = 10, d=2.5, center = false, $fn=100);  
//    
//}

difference(){
  cube([26,6,5], center=true);
    translate([-10,0,-5])
      cylinder (h = 10, d=2.5, center = false, $fn=100);  
    translate([-6,0,-5])
      cylinder (h = 10, d=2.4, center = false, $fn=100);  
    translate([-2,0,-5])
      cylinder (h = 10, d=2.3, center = false, $fn=100);  
    translate([2,5,0])
      rotate([90,90,0])
        cylinder (h = 10, d=2.3, center = false, $fn=100);  
    translate([6,5,0])
      rotate([90,90,0])
        cylinder (h = 10, d=2.4, center = false, $fn=100);  
    translate([10,5,0])
      rotate([90,90,0])
        cylinder (h = 10, d=2.5, center = false, $fn=100);  

}
$fn=100;
cube_length = 90;
cube_width = 50;
cube_height = 3;

difference(){
cube([cube_length,cube_width,cube_height]);

translate([30,cube_width/2,-1])
  resize([50,40,4])
    sphere(r=10);
}

translate([cube_length/2,cube_width/2,cube_height])
  cylinder(r1=7,r2=10,h=18);
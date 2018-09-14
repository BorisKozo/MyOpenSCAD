boxWidth = 40; //The width of the box   (X)
boxDepth = 50; //The depth of the box   (Y)
boxHeight = 15; //The height of the box (Z)

cornerRadius = 3; //The radius of the box corners
wallThickness = 2; //The thickness of the wall
floorThickness = 1; //The thickness of the floor and lid

xCompartments = 2; //Number of compartment on the width (X) axis
yCompartments = 1;  // Number of compartments on the depth (Y) axis

dividerThickness = 1; //The thickness of the divider

lidPatternCols = 5;
lidPatternRows = 5;

lidSnugness = 0.4;
trapezoidAngle = 70;
epsilon = .001; 

include <MCAD/boxes.scad>


module lidPattern(cols,rows) {
    sphereDiameter = 1;
    increment = sphereDiameter*3;
    translate([-(rows*sphereDiameter*increment-increment)/2,-(cols*sphereDiameter*increment-increment)/2, 0])
        for ( i = [0 : cols-1]) {
           for ( j = [0 : rows-1]) {
               translate([j*increment, i*increment, 0])
                  sphere(d=sphereDiameter, $fn=20);
          }   
        }
}

module lid(cutter = false) {
  /*
    Lid profile

       boxX - 2* wall thickness + 2*(wall thickness/tan(trap angle))
    p0 ---------------- p1
       \) trap angle  /
        \            /
    P3   ------------   p2
         boxX - 2* wall thickness
         
  */
    

  // define how snug the fit should be on the lid
  // when this sub is used to "cut" enlarge the dimensions to make the opening larger
  snugness = cutter==true ? lidSnugness:0;
  deltaDepth = cutter==true ? 0:lidSnugness*2;

  // define the lid width (X)
  lidWidth = (boxWidth - 2*wallThickness) + snugness;

  // define the length of the lid (Y) 
  lidDepth = boxDepth - wallThickness + snugness-deltaDepth;

  // define the thickness of the lid
  lidHeight = floorThickness + snugness;

  // define slot dimensions
  slotWidth = lidWidth*.4;


  // define the angle in the trapezoid; this needs to be less than 45 for most printers
 
  lidAdd = wallThickness/tan(trapezoidAngle);
  // define points for the trapezoidal lid
  p0 = [0, 0];
  p1 = [lidWidth, 0];
  p2 = [lidWidth + lidAdd, lidHeight];
  p3 = [0 -lidAdd , lidHeight];
  
  //center the lid

  translate([-lidWidth/2, 0, 0])
    // rotate the lid -90 degrees 
    rotate([-90]){
        difference() {
            // draw a polygon using the points above and then extrude
            // linear extrude only works in the Z axis so everything has to be rotated after
            linear_extrude(height = lidDepth, center = true) 
                polygon([p0, p1, p2, p3], paths = [[0, 1, 2, 3]]);
  
           if ( cutter == false) {
                rotate([-90])
                translate([lidWidth/2, 0, 0])
                    lidPattern(lidPatternCols,lidPatternRows);
            }
      
            // add a fingernail slot for making opening the lid easier
            if ( cutter == false) {
                rotate([90])
                    translate([lidWidth/2, lidDepth/2-4*wallThickness, 0])
                        roundedBox([slotWidth, dividerThickness, floorThickness], radius = dividerThickness/2, $fn=36);
           }
    }

}
}

module basicBox(outerBox, innerBox) {
  // Set the curve refinement
  $fn = 36;


  // Create the box then subtract the inner volume and make a cut for the sliding lid
  difference() {
    // call the MCAD rounded box command imported from MCAD/boxes.scad
    // size = dimensions; radius = corner curve radius; sidesonly = round only some sides

    // First draw the outer box
    roundedBox(size = outerBox, radius = cornerRadius, sidesonly = 1);
    // Then cut out the inner box
    roundedBox(size = innerBox, radius = cornerRadius, sidesonly = 1);
    // Then cut out the lid
    translate([0, wallThickness+lidSnugness, (boxHeight/2)+epsilon])
      lid(cutter = true); 
  }
}

module xDividers(innerBoxDimentions) {
  cols = xCompartments - 1;

  // calculate the spacing of the dividers based on the dimensions of the inner box

  // element 0 of the innerBoxDim variable contains the X dimension  
  increment = innerBoxDimentions[0]/xCompartments;

  // if the number of compartments is bigger than 1, do this:
  if ( xCompartments > 1) {
    // this loops several times to make each divider from 1 to the number of columns
    for ( i = [1 : cols]) {
      // move each divider into place
        translate([-innerBoxDimentions[0]/2+i*increment, 0, 0])
          // draw a cube - remember to remove a bit for the snuggness factor on the lid
          cube([dividerThickness, innerBoxDimentions[1], innerBoxDimentions[2]-floorThickness-lidSnugness
        ], center =true);
      
    } 
  } 
}

module yDividers(innerBoxDimentions) {
  rows = yCompartments - 1;

  // calculate the spacing of the dividers based on the dimensions of the inner box

  increment = innerBoxDimentions[1]/yCompartments;

  // if the number of compartments is bigger than 1, do this:
  if ( yCompartments > 1) {
    // this loops several times to make each divider from 1 to the number of columns
    for ( i = [1 : rows]) {
      // move each divider into place
        translate([0,-innerBoxDimentions[1]/2+i*increment, 0])
          // draw a cube - remember to remove a bit for the snuggness factor on the lid
          cube([innerBoxDimentions[0],dividerThickness, innerBoxDimentions[2]-floorThickness-lidSnugness
        ], center =true);
     
    } 
  } 
} 

module dividedBox() {
  outerBox = [boxWidth, boxDepth, boxHeight];
  innerBox = [boxWidth-2*wallThickness, boxDepth-2*wallThickness, boxHeight-2*floorThickness];

  // call the basic box module to add the box
  basicBox(outerBox, innerBox);
    
  xDividers(innerBox);
  yDividers(innerBox);  
}

dividedBox();

translate([-boxWidth, 0, -boxHeight/2+floorThickness])
   lid();

//lidPattern(5,3);
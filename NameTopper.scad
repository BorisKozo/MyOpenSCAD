/*[Name Settings]*/
text_string    = "Mickey";
font_name      = "Comic Neue:style=Bold";  // font
letter_height  = 12;      // mm
letter_depth   = 1.2;     // mm (height of raised letters above the base)
outline_margin = 2.3;     // mm (halo around letters)
base_height = 14;         // mm

/*[Hole Settings]*/
hole_diameter  = 7.9;     // mm 
hole_length    = 120;     // mm (long enough to cut fully L↔R)
hole_horizontal  = 3;      // mm 
hole_vertical = 1;
hole_depth_pos = base_height-hole_diameter/2-hole_vertical;     // mm (center under body of letters)

/*[Color]*/
base_color    = "#D11C7D"; // color
letters_color = "#FFFFFF"; // color

/*[Direction/Aligment]*/
rtl = false;

/*[Slider]*/
rail_length = 40;
rail_offset = 2;
rail_tollerance = 0.25;
slider_length = 20;
slider_width = 8;

// Make sure the user supplied some text
assert(str(text_string) != "", "Error: text_string must not be empty");

// Decide horizontal alignment for text()
text_halign = rtl ? "right" : "left";

module base_with_tunnel() {
    difference() {
        // 1) Extrude the “halo” around text from Z = 0 → base_height
        linear_extrude(height = base_height)
            offset(delta = outline_margin)
                text(
                    text_string,
                    size   = letter_height,
                    font   = font_name,
                    halign = text_halign,
                    valign = "baseline"
                );

        // 2) Subtract a horizontal cylinder (axis = X)
        translate([0, hole_horizontal, hole_depth_pos])
            rotate([0, 90, 0])
                cylinder(
                    d      = hole_diameter,
                    h      = hole_length,
                    center = true,
                    $fn    = 100
                );
    }
}

module raised_letters() {
    translate([0, 0, base_height])
        linear_extrude(height = letter_depth)
            text(
                text_string,
                size   = letter_height,
                font   = font_name,
                halign = text_halign,
                valign = "baseline"
            );
}

module slider_hole() {
  translate([rail_offset-1,0,0])
    rotate([90,0,90])  
      linear_extrude(rail_length)
        polygon([
                    [0-rail_tollerance,3+rail_tollerance],
                    [1-rail_tollerance,0-rail_tollerance],
                    [slider_width+rail_tollerance,0-rail_tollerance],
                    [slider_width+1+rail_tollerance,3+rail_tollerance]
                ]);
}

module slider() {
  translate([rail_offset,0,0])
    rotate([90,0,90])  
      linear_extrude(slider_length)
        polygon([[0,3],[1,0],[slider_width,0],[slider_width+1,3]]);
}


module name_topper() {
    // Draw the colored base + tunnel
    color(base_color);
    difference() {
      base_with_tunnel();  
      slider_hole();
    }
    slider();
    // Draw the raised letters on top
    color(letters_color); 
    raised_letters();

}

name_topper();
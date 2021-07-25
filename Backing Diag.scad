// Units are in MM
module Backing(
    monitor_size=439.42, // 17.3
    monitor_aspect_width=16,
    monitor_aspect_height=9,
    backing_offset=5,
    monitor_backing_split=2,
    monitor_backing_depth=5,
    monitor_cross_width=5,
) {
    monitor_aspect_diag = sqrt((monitor_aspect_width^2) + (monitor_aspect_height^2));
    monitor_aspect_factor = monitor_size / monitor_aspect_diag;
    monitor_width = monitor_aspect_width * monitor_aspect_factor;
    monitor_height = monitor_aspect_height * monitor_aspect_factor;
    nothing = .01;
    // Backing
    brace_angle = acos((monitor_size^2 + monitor_width^2 - monitor_height^2) / (2 * monitor_size * monitor_width));
    for (y=[1:monitor_backing_split]) {
        translate([0, 0, (y % monitor_backing_split)*(monitor_height/monitor_backing_split)]) {
        for (x=[1:monitor_backing_split]) {
            brace_width = monitor_width/monitor_backing_split;
            brace_height = monitor_height/monitor_backing_split;
            brace_size = monitor_size/monitor_backing_split;
                translate([(x % monitor_backing_split)*(monitor_width/monitor_backing_split), 0, 0]){
                    difference() {
                        cube([
                            brace_width,
                            monitor_backing_depth,
                            brace_height
                        ]);
                        translate([backing_offset, -nothing, backing_offset])
                        cube([
                            brace_width - (backing_offset*2),
                            monitor_backing_depth+nothing*2,
                            brace_height - (backing_offset*2)
                        ]);
                    }

                    // Crossbrace
                    difference(){
                        union(){
                            translate([0, 0, -monitor_cross_width/2])
                            rotate([0, -brace_angle, 0])
                                cube(size=[brace_size, monitor_backing_depth, monitor_cross_width]);
                            translate([0, 0, brace_height]){
                            translate([0, 0, -monitor_cross_width/2])
                            rotate([0, brace_angle, 0])
                                cube(size=[brace_size, monitor_backing_depth, monitor_cross_width]);
                            }
                        }
                        translate([0, -nothing, 0])
                        difference() {
                            translate([-backing_offset, -nothing, -backing_offset])
                            cube([
                                brace_width+backing_offset*2,
                                monitor_backing_depth*2,
                                brace_height+backing_offset*2
                            ]);
                            translate([-0, -monitor_backing_depth, -0])
                            cube([
                                brace_width,
                                monitor_backing_depth*4,
                                brace_height
                            ]);
                        }
                    }
                }
            }
        }
    }
}


module BackingJoined(
    monitor_size=439.42, // 17.3
    monitor_aspect_width=16,
    monitor_aspect_height=9,
    backing_offset=5,
    monitor_backing_split=2,
    monitor_backing_depth=5,
    monitor_cross_width=5
) {
    monitor_aspect_diag = sqrt((monitor_aspect_width^2) + (monitor_aspect_height^2));
    monitor_aspect_factor = monitor_size / monitor_aspect_diag;
    monitor_width = monitor_aspect_width * monitor_aspect_factor;
    monitor_height = monitor_aspect_height * monitor_aspect_factor;
    nothing = .05;
    // Backing
    brace_angle = acos((monitor_size^2 + monitor_width^2 - monitor_height^2) / (2 * monitor_size * monitor_width));
    union(){
        for (y=[1:monitor_backing_split]) {
            translate([0, 0, (y % monitor_backing_split)*(monitor_height/monitor_backing_split) + (nothing * (y-1))]) {
            for (x=[1:monitor_backing_split]) {
                brace_width = monitor_width/monitor_backing_split;
                brace_height = monitor_height/monitor_backing_split;
                brace_size = monitor_size/monitor_backing_split;
                    translate([(x % monitor_backing_split)*(monitor_width/monitor_backing_split) + (nothing * (x-1)), 0, 0]){
                        difference() {
                            cube([
                                brace_width,
                                monitor_backing_depth,
                                brace_height
                            ]);
                            translate([backing_offset, -nothing, backing_offset])
                            cube([
                                brace_width - (backing_offset*2),
                                monitor_backing_depth+nothing*2,
                                brace_height - (backing_offset*2)
                            ]);
                        }

                        // Crossbrace
                        difference(){
                            union(){
                                translate([0, 0, -monitor_cross_width/2])
                                rotate([0, -brace_angle, 0])
                                    cube(size=[brace_size, monitor_backing_depth, monitor_cross_width]);
                                translate([0, 0, brace_height]){
                                translate([0, 0, -monitor_cross_width/2])
                                rotate([0, brace_angle, 0])
                                    cube(size=[brace_size, monitor_backing_depth, monitor_cross_width]);
                                }
                            }
                            translate([0, -nothing, 0])
                            difference() {
                                translate([-backing_offset, -nothing, -backing_offset])
                                cube([
                                    brace_width+backing_offset*2,
                                    monitor_backing_depth*2,
                                    brace_height+backing_offset*2
                                ]);
                                translate([-0, -monitor_backing_depth, -0])
                                cube([
                                    brace_width,
                                    monitor_backing_depth*4,
                                    brace_height
                                ]);
                            }
                        }
                    }
                }
            }
        }
    }
}
// Units are in MM
module Backing(
    backing_plane_width,
    backing_plane_height,
    backing_offset=5,
    monitor_backing_split=2,
    monitor_backing_depth=5,
    monitor_cross_width=5,
    overlap=0
) {
    nothing = .01;
    // Recalc with offset
    backing_plane_diag = sqrt(backing_plane_width^2 + backing_plane_height^2);
    brace_angle = acos((backing_plane_diag^2 + backing_plane_width^2 - backing_plane_height^2) / (2 * backing_plane_diag * backing_plane_width));

    // Backing
    for (y=[1:monitor_backing_split]) {
        translate([0, 0, (y % monitor_backing_split)*(backing_plane_height/monitor_backing_split)]) {
        for (x=[1:monitor_backing_split]) {
            brace_width = backing_plane_width/monitor_backing_split;
            brace_height = backing_plane_height/monitor_backing_split;
            brace_size = backing_plane_diag/monitor_backing_split;
                translate([(x % monitor_backing_split)*(backing_plane_width/monitor_backing_split), 0, 0]){
                    // Border
                    difference() {
                        translate([-overlap/2, 0, -overlap/2])
                        cube([
                            brace_width + overlap,
                            monitor_backing_depth,
                            brace_height + overlap
                        ]);
                        translate([backing_offset + (overlap), -nothing, backing_offset + (overlap)])
                        cube([
                            brace_width - (backing_offset*2) - overlap*2,
                            monitor_backing_depth+nothing*2,
                            brace_height - (backing_offset*2) - overlap*2
                        ]);
                    }

                    // Crossbrace
                    difference(){
                        union(){
                            translate([0, 0, -(monitor_cross_width + overlap)/2])
                            rotate([0, -brace_angle, 0])
                                cube(size=[brace_size, monitor_backing_depth, monitor_cross_width + overlap]);
                            translate([0, 0, brace_height]){
                            translate([0, 0, -(monitor_cross_width + overlap)/2])
                            rotate([0, brace_angle, 0])
                                cube(size=[brace_size, monitor_backing_depth, monitor_cross_width + overlap]);
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
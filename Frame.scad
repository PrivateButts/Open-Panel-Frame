module Frame(
    monitor_width,
    monitor_height,
    panel_bezel_top,
    panel_bezel_left,
    panel_bezel_right,
    panel_bezel_bottom,
    monitor_depth,
    thickness
) {
    difference() {
        cube([
            monitor_width + panel_bezel_left + panel_bezel_right + thickness*2,
            monitor_depth + thickness*2,
            monitor_height + panel_bezel_top + panel_bezel_bottom + thickness*2
        ], center=true);
        translate([0, 0, (panel_bezel_top + panel_bezel_bottom)/2 - (thickness/2)]){
            translate([0, 0, -panel_bezel_bottom/2])
            cube([
                monitor_width + panel_bezel_left + panel_bezel_right,
                monitor_depth,
                monitor_height + panel_bezel_top + panel_bezel_bottom
            ], center=true);
            cube([
                monitor_width,
                monitor_depth * 2,
                monitor_height
            ], center=true);
        }
        translate([0, (monitor_depth+thickness-.01), 0])
        cube([
            monitor_width + panel_bezel_left + panel_bezel_right + thickness*2 + .01,
            monitor_depth + thickness*2,
            monitor_height + panel_bezel_top + panel_bezel_bottom + thickness*2 + .01
        ], center=true);
    }
}
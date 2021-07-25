include <VESAMount.scad>
include <Backing.scad>
include <Frame.scad>
include <Clip.scad>
include <ControlBoard.scad>

monitor_size = 439.42; // 17.3
monitor_depth = 5;
monitor_aspect_width = 16;
monitor_aspect_height = 9;
backing_offset = 5;
monitor_backing_split = 2;
monitor_backing_depth = 5;
monitor_cross_width = 5;
panel_bezel_top = 2.4;
panel_bezel_left = 2.4;
panel_bezel_right = 2.4;
panel_bezel_bottom = 19;
frame_thickness = 2;

monitor_aspect_diag = sqrt((monitor_aspect_width^2) + (monitor_aspect_height^2));
monitor_aspect_factor = monitor_size / monitor_aspect_diag;
monitor_width = monitor_aspect_width * monitor_aspect_factor;
monitor_height = monitor_aspect_height * monitor_aspect_factor;

echo(str("Size = ", monitor_width, "x", monitor_height));

vesa_mount_border = 5;
vesa_mount_depth = 7.5;
vesa_mount_overlap = 2.5;
vesa_hole_spacing_x = 75;
vesa_hole_spacing_y = 75;
vesa_hole_radius = 2;

cb_width = 82;
cb_height = 60;
cb_hole_spacing_x = 76;
cb_hole_spacing_y = 54;
cb_hole_radius = 2;
cb_thickness = 3;

clip_count = 8;


// Panel
color([1,0,0])
cube([monitor_width, monitor_depth, monitor_height], center=true);


// Frame
translate([0, -7, -(panel_bezel_bottom)/2])
Frame(
    monitor_width,
    monitor_height,
    panel_bezel_top,
    panel_bezel_left,
    panel_bezel_right,
    panel_bezel_bottom,
    monitor_depth,
    frame_thickness
);


// Backing grid
translate([0, 5, -(monitor_height+panel_bezel_bottom)/2])
translate([-(monitor_width+panel_bezel_left+panel_bezel_right)/2, 0, -(panel_bezel_bottom+panel_bezel_top)/2])
Backing(
    monitor_width + panel_bezel_left + panel_bezel_right,
    monitor_height + panel_bezel_top + panel_bezel_bottom,
    backing_offset,
    monitor_backing_split,
    monitor_backing_depth,
    monitor_cross_width
);


// VESA Mount
translate([0, 10, -(monitor_height)/2])
translate([-(monitor_width+panel_bezel_left+panel_bezel_right)/2, 0, -(panel_bezel_bottom+panel_bezel_top)/2])
difference(){
    translate([monitor_width/2, monitor_backing_depth + (vesa_mount_depth/2) - vesa_mount_overlap, monitor_height/2])
    VESAMount(
        vesa_mount_border,
        vesa_mount_depth,
        vesa_hole_spacing_x,
        vesa_hole_spacing_y,
        vesa_hole_radius
    );
    translate([-panel_bezel_left, 0, -(panel_bezel_bottom+panel_bezel_top)/2])
    Backing(
        monitor_width + panel_bezel_left + panel_bezel_right,
        monitor_height + panel_bezel_top + panel_bezel_bottom,
        backing_offset,
        monitor_backing_split,
        monitor_backing_depth,
        monitor_cross_width,
        1
    );
}


// Clips
translate([0, -40, 0]) {
    for (i=[1:clip_count]) {
        translate([i*(frame_thickness+backing_offset+5), 0, 0])
        Clip(
            length=monitor_depth+frame_thickness,
            front_tab_size=2,
            back_width=frame_thickness+backing_offset,
            back_tab_size=2,
            width=5,
            thickness=1
        );
    }
}


// Control Board Backing
translate([-145, 15, -90])
Board(
    cb_width,
    cb_height,
    cb_hole_spacing_x,
    cb_hole_spacing_y,
    cb_hole_radius,
    cb_thickness
);
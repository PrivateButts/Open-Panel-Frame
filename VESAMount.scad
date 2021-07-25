module VESAMount(
    mount_border=5,
    mount_depth=5,
    hole_spacing_x=75,
    hole_spacing_y=75,
    hole_radius=4
) {
    difference() {
        cube([hole_spacing_x + hole_radius + (2 * mount_border), mount_depth, hole_spacing_y + hole_radius + (2 * mount_border)], center=true);

        translate([hole_spacing_x/2, 0, hole_spacing_y/2])
        rotate([90, 0, 0])
        cylinder(r=hole_radius, h=mount_depth * 2, center=true);

        translate([hole_spacing_x/2, 0, -hole_spacing_y/2])
        rotate([90, 0, 0])
        cylinder(r=hole_radius, h=mount_depth * 2, center=true);

        translate([-hole_spacing_x/2, 0, hole_spacing_y/2])
        rotate([90, 0, 0])
        cylinder(r=hole_radius, h=mount_depth * 2, center=true);

        translate([-hole_spacing_x/2, 0, -hole_spacing_y/2])
        rotate([90, 0, 0])
        cylinder(r=hole_radius, h=mount_depth * 2, center=true);
    }
}
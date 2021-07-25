module Board(
    width=82,
    height=60,
    hole_spacing_x=76,
    hole_spacing_y=54,
    hole_radius=2,
    thickness=3
) {
    difference() {
        cube(size=[width, thickness, height], center=true);

        translate([hole_spacing_x/2, 0, hole_spacing_y/2])
        rotate([90, 0, 0])
        cylinder(r=hole_radius, h=thickness * 2, center=true);

        translate([hole_spacing_x/2, 0, -hole_spacing_y/2])
        rotate([90, 0, 0])
        cylinder(r=hole_radius, h=thickness * 2, center=true);

        translate([-hole_spacing_x/2, 0, hole_spacing_y/2])
        rotate([90, 0, 0])
        cylinder(r=hole_radius, h=thickness * 2, center=true);

        translate([-hole_spacing_x/2, 0, -hole_spacing_y/2])
        rotate([90, 0, 0])
        cylinder(r=hole_radius, h=thickness * 2, center=true);
    }
}
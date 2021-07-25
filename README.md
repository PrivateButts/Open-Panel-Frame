# Open Panel Frame

*This project is still a work in progress and hasn't been tested yet. There will certainly be changes when I attempt to print this. Use at your own risk.*

None of the currently available panel frames on 3d file websites fit my panel, so this is an attempt to make one myself and learn OpenSCAD at the same time. This design is intended to be universal, and fit any size or aspect of panel. It was designed around a 17.3 in 16:9 panel, so it may get funky when making weird shapes.

Part | Description
-----|------------
Monitor | Main file, instances all the modules and contains the config
Clip | Used to hold all the pieces together
ControlBoard | Used to hold the control board
VESAMount | Used to attach to mounts
Frame | Front panel of the monitor
Backing | Support pieces for the panel

## Customizer Documentation

Parameter | Unit | Description
----------|------|------------
monitor_size | mm | Size of the panel diagonal
monitor_depth | mm | How thick the panel is
monitor_aspect_width | | First number in the aspect ratio pair
monitor_aspect_height | | Second number in the aspect ratio pair
backing_offset | mm | Controls the inset operation on the backing. 
monitor_backing_split | Count | Controls backing subdivisons. Use larger numbers for smaller print beds
monitor_backing_depth | mm | How thick to make the backing sections
monitor_cross_width | mm | How thick to make the diagonal sections of the backing crossbraces
panel_bezel_top | mm | Top bezel of the panel
panel_bezel_left | mm | Left bezel of the panel
panel_bezel_right | mm | right bezel of the panel
panel_bezel_bottom | mm | bottom bezel of the panel
frame_thickness | mm | Thickness of the front shell
vesa_mount_border | mm | How much extra material you need outside of the screw holes
vesa_mount_depth | mm | How thick you want the VESA mount section
vesa_mount_overlap | mm | How much you want the VESA mount to overlap the backing
vesa_hole_spacing_x | mm | Controls how wide you want the VESA mount spaced on the x axis of the monitor. 
vesa_hole_spacing_y | mm | Controls how wide you want the VESA mount spaced on the y axis of the monitor. 
vesa_hole_radius | mm | Controls how wide you want the screw holes for the VESA mount
cb_width | mm | Width of mounting plate for your control board
cb_height | mm | Height of mounting plate for your control board
cb_hole_spacing_x | mm | Where to put the mounting screws on the control board plate
cb_hole_spacing_y | mm | Where to put the mounting screws on the control board plate
cb_hole_radius | mm | Size of the screw holes on the control board mounting plate
cb_thickness | mm | Thickness of the control board mounting plate
clip_count | mm | How many clips to generate 

## Attribution

- Joints provided by [HopefulLlama's wonderful library](https://github.com/HopefulLlama/JointSCAD)

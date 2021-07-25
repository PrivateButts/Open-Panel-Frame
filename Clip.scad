module Clip(
    length=10,
    front_tab_size=2,
    back_width=4,
    back_tab_size=2,
    width=5,
    thickness=1
) {
    linear_extrude(height=5, center=true)
    polygon(
        points=[
            [0,0],[front_tab_size,0],[front_tab_size,length],[front_tab_size-back_width-thickness,length],[front_tab_size-back_width,length],[front_tab_size-back_width,length-back_tab_size],
            [front_tab_size-back_width-thickness,length-back_tab_size],[front_tab_size-back_width-thickness,length+thickness],[front_tab_size+thickness,length+thickness],[front_tab_size+thickness,0-thickness],[0,0-thickness]
        ], paths=[[0,1,2,3,4,5,6,7,8,9,10]]);

}
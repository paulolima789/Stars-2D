target_ = obj_player_2
width_ = camera_get_view_width(view_camera[0])
height_ = camera_get_view_height(view_camera[0])


x = lerp(x, target_.x,0.1)
y = lerp(y, target_.y-height_/4, 0.1)
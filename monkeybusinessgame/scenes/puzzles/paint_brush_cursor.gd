extends Sprite2D

func _process(delta):
	global_position = get_global_mouse_position()  # Make the brush follow the cursor

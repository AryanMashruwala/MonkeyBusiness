extends Area2D

func _on_area_2d_body_entered(body):
	if body is TextureButton:  # Check if a puzzle piece enters
		body.snap_to_position(global_position)  # Snap to the center of the area
		print("Snapped:", body.name)  # Debugging output

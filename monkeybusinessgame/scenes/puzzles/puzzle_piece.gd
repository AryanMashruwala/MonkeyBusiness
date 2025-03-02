extends Area2D  # Make sure paper_piece is Area2D!

var selected = false
var mouse_offset = Vector2.ZERO

func _process(delta):
	if selected:
		position = get_global_mouse_position() + mouse_offset  # Move piece to follow mouse

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			#print("🖱️ Clicked on:", name)
			mouse_offset = position - get_global_mouse_position()
			selected = true
		else:
			#print("🖱️ Released:", name)
			selected = false


func _on_slot_1_area_entered(area: Area2D) -> void:
	#print("huh Puzzle piece entered slot:", area.name, self.name)
	pass

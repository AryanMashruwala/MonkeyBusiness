extends TextureButton
var dragging = false
var offset = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		dragging = true
		offset = event.position - global_position
		set_z_index(10)
	elif event is InputEventMouseButton and not event.pressed:
		dragging = false
		set_z_index(1)
	
	if event is InputEventMouseMotion and dragging:
		global_position += event.relative  # Moves based on mouse movement

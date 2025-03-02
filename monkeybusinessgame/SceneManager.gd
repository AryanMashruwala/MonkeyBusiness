extends Node

var main_office = null
var current_overlay = null

func _ready():
	# Store the initial scene (assuming it's main_office)
	main_office = get_tree().current_scene

func switch_scene(scene_path: String):
	# If switching to a puzzle, overlay it
	if scene_path != "res://scenes/main_office.tscn":
		if current_overlay:
			current_overlay.queue_free()  # Remove any existing overlay before adding a new one
			await get_tree().process_frame  # Ensure it's fully removed before adding a new one
		var new_scene = load(scene_path).instantiate()
		get_tree().current_scene.add_child(new_scene)  # Add to the current main scene instead of root
		current_overlay = new_scene
	else:
		# If returning to main_office, remove the overlay
		if current_overlay:
			current_overlay.queue_free()
			await get_tree().process_frame  # Allow time for removal
			current_overlay = null

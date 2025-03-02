extends Button

func _ready():
	self.modulate.a = 0  # Make the button invisible at the start
func _on_pressed():
	print("Start button clicked!")  # Debugging
	get_tree().change_scene_to_file("res://scenes/main_office.tscn")  # Replace with actual scene path

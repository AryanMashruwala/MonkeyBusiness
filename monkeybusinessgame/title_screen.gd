extends Control

@onready var start_button = $start_button  # Adjust the path if necessary

func _ready():
	start_button.modulate.a = 0  # Set alpha to 0 (fully transparent)
	
func _on_start_button_pressed():
	print("Start button clicked!")
	get_tree().change_scene_to_file("res://scenes/main_office.tscn") # Replace with your actual game scene path

extends Node2D

var selected_color = null  # The currently selected color
var palette_colors = {}  # Maps palette buttons to colors
var number_to_color = {}  # Maps canvas buttons to corresponding color layers
var number_to_name = {}  # Maps canvas buttons to corresponding color layers
var brush_sprites = {}  # Stores references to brush sprites
var painted_colors = {"yellow": false, "green": false, "blue": false}  # Tracks which colors have been painted

func _ready():
	# Connect palette buttons
	for button in $"Palette".get_children():
		if button is Button:
			button.modulate.a = 0
			button.pressed.connect(_on_palette_pressed.bind(button))

	# Connect canvas buttons
	for button in $"ColorLayers".get_children():
		if button is Button:
			button.modulate.a = 0
			button.pressed.connect(_on_canvas_button_pressed.bind(button))
	
	# Store references to the paintbrush sprites
	brush_sprites = {
		"yellow": $"PaintBrushCursor/YellowBrush",
		"green": $"PaintBrushCursor/GreenBrush",
		"blue": $"PaintBrushCursor/BlueBrush"
	}
	
	for brush in brush_sprites.values():
		brush.visible = false

	# Define mappings for palette colors
	palette_colors = {
		"Yellow1": "yellow",
		"Green2": "green",
		"Blue3": "blue"
	}

	# Define mappings for canvas buttons to color areas
	number_to_color = {
		"yB1": $"ColorLayers/Yellow1",
		"yB2": $"ColorLayers/Yellow1",
		"yB3": $"ColorLayers/Yellow1",
		"yB4": $"ColorLayers/Yellow1",
		"yB5": $"ColorLayers/Yellow1",
		"yB6": $"ColorLayers/Yellow1",
		"yB7": $"ColorLayers/Yellow1",
		"yB8": $"ColorLayers/Yellow1",
		"gB1": $"ColorLayers/Green2",
		"gB2": $"ColorLayers/Green2",
		"gB3": $"ColorLayers/Green2",
		"gB4": $"ColorLayers/Green2",
		"gB5": $"ColorLayers/Green2",
		"gB6": $"ColorLayers/Green2",
		"gB7": $"ColorLayers/Green2",
		"gB8": $"ColorLayers/Green2",
		"gB9": $"ColorLayers/Green2",
		"bB1": $"ColorLayers/Blue3",
		"bB2": $"ColorLayers/Blue3",
		"bB3": $"ColorLayers/Blue3",
		"bB4": $"ColorLayers/Blue3",
		"bB5": $"ColorLayers/Blue3",
		"bB6": $"ColorLayers/Blue3",
		"bB7": $"ColorLayers/Blue3",
		"bB8": $"ColorLayers/Blue3",
		"bB9": $"ColorLayers/Blue3",
		"bB10": $"ColorLayers/Blue3"
	}
	
	number_to_name = {
		"yB1": "yellow",
		"yB2": "yellow",
		"yB3": "yellow",
		"yB4": "yellow",
		"yB5": "yellow",
		"yB6": "yellow",
		"yB7": "yellow",
		"yB8": "yellow",
		"gB1": "green",
		"gB2": "green",
		"gB3": "green",
		"gB4": "green",
		"gB5": "green",
		"gB6": "green",
		"gB7": "green",
		"gB8": "green",
		"gB9": "green",
		"bB1": "blue",
		"bB2": "blue",
		"bB3": "blue",
		"bB4": "blue",
		"bB5": "blue",
		"bB6": "blue",
		"bB7": "blue",
		"bB8": "blue",
		"bB9": "blue",
		"bB10": "blue"
	}

	# Hide all color layers at the start
	for color_layer in ["Yellow1", "Green2", "Blue3"]:
		$"ColorLayers".get_node(color_layer).visible = false

func _on_palette_pressed(button: Button):
	selected_color = palette_colors.get(button.name, null)
	
	for brush in brush_sprites.values():
		brush.visible = false
	
	if selected_color and brush_sprites.has(selected_color):
		brush_sprites[selected_color].visible = true

func _on_canvas_button_pressed(button: Button):
	var color_layer = number_to_color.get(button.name, null)
	var color_name = number_to_name.get(button.name, null)

	# Check if the selected palette color matches the correct layer
	if color_layer and selected_color:
		if selected_color == color_name:
			color_layer.visible = true  # Reveal the correct color layer
			painted_colors[selected_color] = true  # Mark this color as painted
			check_completion()

func check_completion():
	if painted_colors["yellow"] and painted_colors["green"] and painted_colors["blue"]:
		change_scene()

func change_scene():
	if get_parent():
		queue_free()  # Ensure this scene is removed before switching back
	await get_tree().process_frame  # Allow time for removal
	SceneManager.switch_scene("res://scenes/main_office.tscn")

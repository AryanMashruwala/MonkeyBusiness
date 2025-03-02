extends Area2D

@export var next_room: NodePath  # Assign next room in the Inspector

func _ready():
	var exit_trigger = $ExitTrigger  # Reference the ExitTrigger node inside this room
	exit_trigger.body_exited.connect(_on_exit_trigger_body_exited)

func get_spawn_position() -> Vector2:
	var spawn_point = $SpawnPoint  # Reference the Marker2D inside this room
	return spawn_point.global_position if spawn_point else global_position

func _on_exit_trigger_body_exited(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://end_screen.tscn")

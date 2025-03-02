extends Area2D

@export var next_room: NodePath  # Assign next room in the Inspector

func _ready():
	var exit_trigger = $ExitTrigger  # Reference the ExitTrigger node inside this room
	exit_trigger.body_exited.connect(_on_exit_trigger_body_exited)

func get_spawn_position() -> Vector2:
	var spawn_point = $SpawnPoint  # Reference the Marker2D inside this room
	return spawn_point.global_position if spawn_point else global_position

func _on_exit_trigger_body_exited(body):
	if body is CharacterBody2D and next_room:
		var next_room_node = get_node(next_room)
		body.teleport_to_room(next_room_node)

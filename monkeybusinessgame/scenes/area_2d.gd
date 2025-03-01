extends Area2D

@onready var talkPrompt = $TalkPrompt
var playerNearby = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		talkPrompt.visible = true
		playerNearby = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		talkPrompt.visible = false
		playerNearby = false
	
func _physics_process(delta):
	pass
	
func _ready() -> void:
	talkPrompt.visible = false

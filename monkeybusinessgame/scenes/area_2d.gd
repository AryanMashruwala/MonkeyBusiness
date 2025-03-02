extends Area2D

@onready var talkPrompt = $TalkPrompt
@onready var dialogue_box = get_parent().get_node("DialogueBox")

var dialogue0: Array[String] = [
	"Hi, my name is John Bananas!", "I am waiting for my performance review, but I am fed up with this company.", "I wish I could know now..."
]

var dialogue1: Array[String] = [
	"Wow I can't believe they said I am a bad employee.", "Thank you for showing me...", "SCREW THESE GUYS, I QUIT!"
]

var playerRef 

var success_state = false

var dialogue_open = false


var playerNearby = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		talkPrompt.visible = true
		playerNearby = true
		playerRef = body
		if body.getEthos():
			success_state = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		talkPrompt.visible = false
		playerNearby = false
	
func _physics_process(delta):
	pass
	
func _process(delta: float) -> void:
	pass
	
		
func _input(event: InputEvent) -> void:
		if playerNearby and Input.is_action_pressed("talk") and !dialogue_open:
			playerRef.toggleCanMove()
			print("talk input npc called")
			dialogue_open = true
			dialogue_box.visible = true
			if success_state:
				dialogue_box.renderTextbox(dialogue1)
			else:
				dialogue_box.renderTextbox(dialogue0)
		elif dialogue_box.get_node("TextBoxContainer").visible == false:
			dialogue_open = false
			playerRef.toggleCanMove()
		
	
func _ready() -> void:
	talkPrompt.visible = false
	

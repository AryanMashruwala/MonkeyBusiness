extends Area2D

@onready var talkPrompt = $TalkPrompt
@onready var dialogue_box = get_parent().get_node("DialogueBox")
@onready var npc = get_parent()

var monkeyTypes = ["pathos","ethos","logos"]

var currType = 0

var ethos_dialogue_before: Array[String] = [
	"Why should I leave? I know they value my work here.",
	"You're all talk. If you had some real proof, I'd actually listen.",
	"Go away. I know you have nothing to show me."
]

var ethos_dialogue_after: Array[String]  = [
	"Wow... why would they write that? I thought they cared.",
	"And to think I paid for Bob's birthday cake last week.",
	"I better update my LinkedIn. Go on through, sir."
]

var pathos_dialogue_before: Array[String]  = [
	"Sorry, you're not getting through. Sure, my boss isn't great, but it pays the bills.",
	"I heard Amy invited everyone to a picnic tomorrow. It's BYOB—bring your own banana.",
	"Oh wait, I agreed to overtime this weekend. Guess the bananas will have to wait."
]

var pathos_dialogue_after: Array[String]  = [
	"What a nice painting. It reminds me of the bananas I used to pick with my kids.",
	"I don't spend enough time with them anymore... You're right, I need a new job.",
	"You go ahead, I won't say anything. I'm taking my family on a nice tree vacation."
]

var logos_dialogue_before: Array[String]  = [
	"Back off, pal. Frankly, I don't know how you got this job with your experience.",
	"In my department, we hire people who can actually use a little brainpower.",
	"I wouldn't trust a guy unless he can think things through, and that's not you."
]

var logos_dialogue_after: Array[String]  = [
	"Whoa... you make a good point. I wasn't connecting the dots quite right.",
	"Four years of college, just to end up in a cubicle. They said computer science was a good degree...",
	"I thought so critically that I lost my passion. It's time to pursue my dream of being a circus monkey."
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
		currType = body.getCurrRoom()
		#if body.getEthos():
			#success_state = true

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
				dialogue_box.renderTextbox(ethos_dialogue_after)
			else:
				if (currType == 0):
					dialogue_box.renderTextbox(pathos_dialogue_before)
				elif (currType == 1):
					dialogue_box.renderTextbox(ethos_dialogue_before)
				elif (currType == 2):
					dialogue_box.renderTextbox(logos_dialogue_before)
		elif dialogue_box.get_node("TextBoxContainer").visible == false and dialogue_box.get_node("ChooseTypeButtons").visible == false:
			dialogue_open = false
			playerRef.toggleCanMove()
		
	
func _ready() -> void:
	talkPrompt.visible = false
	
func acceptButtonInput(input: String):
	
	if input != monkeyTypes[currType]:
		loadLose()
	else: 
		togglePuzzle()
		
func loadLose():
	print("you lose")
	pass
	
func togglePuzzle():
	playerRef.incCurrRoom()
	npc.queue_free()
	if currType == 0:
		SceneManager.switch_scene("res://scenes/puzzles/paint_by_numbers_game.tscn")  # Change to the next scene
	#elif currType == 1:
		#SceneManager.switch_scene("res://scenes/puzzles/paint_by_numbers_game.tscn")  # Change to the next scene
	#elif currType == 2:
		#SceneManager.switch_scene("res://scenes/puzzles/paint_by_numbers_game.tscn")  # Change to the next scene

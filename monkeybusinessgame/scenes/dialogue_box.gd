extends CanvasLayer

const CHAR_READ_RATE = 0.05

@onready var textbox_container = $TextBoxContainer
@onready var start = $TextBoxContainer/MarginContainer/HBoxContainer/start
@onready var end = $TextBoxContainer/MarginContainer/HBoxContainer/end
@onready var body = $TextBoxContainer/MarginContainer/HBoxContainer/body



#@onready var tween = get_tree().create_tween()


enum State {
	READY,
	READING, 
	FINISHED
}

var current_state = State.READY

var tween

var step = 0
var lines = []

func _input(event):
	if Input.is_action_just_pressed("talk"):
		match current_state:
			State.READY:
				pass
			State.READING:
				print("should skip")
				if tween and tween.is_running():
					tween.kill()
				body.set_visible_ratio(1)
				changeState(State.FINISHED)
			State.FINISHED:
				step += 1
				if step > len(lines) - 1:
					step = 0
					body.set_visible_ratio(0)
					close_dialogue()
					return
				

				body.set_visible_ratio(0)
				updateTextbox()
	#if self.visible and event is InputEventKey and event.pressed and step < len(lines) - 1 and current_state == State.FINISHED:
		#print(step)
		#step += 1
		#updateTextbox()

func close_dialogue():
	changeState(State.READY)
	textbox_container.visible = false
	
func _process(delta: float) -> void:
	
	match current_state: 
		State.READY:
			pass
		State.READING:
			pass
		State.FINISHED:
			pass

func _ready() -> void:
	body.text = ""
	start.text = "> "
	end.text = ""	
	
func renderTextbox(dialog_lines: Array[String]):
	if tween and tween.is_running():
		tween.kill()
	lines = dialog_lines
	textbox_container.visible = true
	print(lines)
	
	updateTextbox()

func hideTextbox():
	textbox_container.visible = false
	
func updateTextbox():
	changeState(State.READING)
	print(current_state)
	body.text = lines[step]
	
	tween = get_tree().create_tween()
	tween.tween_property(body, "visible_ratio", 1, len(lines[step]) * CHAR_READ_RATE).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	#tween.play()
	tween.finished.connect(_on_Tween_tween_all_completed)

func _on_Tween_tween_all_completed():
	print("is finished")
	end.text = "Press T"
	changeState(State.FINISHED)
	
func changeState(next_state):
	current_state = next_state
	match current_state: 
		State.READY:
			pass
		State.READING:
			end.text = ""
		State.FINISHED:
			end.text = "Press 'T'"
	
	
	

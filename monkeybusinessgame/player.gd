extends CharacterBody2D


var lastDir = "s_idle"
@onready var animation = $AnimatedSprite2D

var currRoom = 0

var canMove = true
const SPEED = 100
var current_room: Area2D = null

var ethosComp = true
var pathosComp = false
var logosComp = false

func getCurrRoom():
	return currRoom
func incCurrRoom():
	currRoom = currRoom + 1

func getEthos():
	return ethosComp

func getPathos():
	return pathosComp
	
func getLogos():
	return logosComp
	
func toggleCanMove():
	canMove = !canMove


func _ready() -> void:
	pass



func _process(delta: float) -> void:

	var direction = Input.get_vector("left","right","up","down")

	velocity = direction * SPEED

	move_and_slide()
	
	var x = direction.x
	var y = direction.y
	

	

	
	if x > 0 and y == 0: # east
		animation.play("e_walk")
		lastDir = "e_idle"
	elif x == 0 and y > 0: #south
		animation.play("s_walk")
		lastDir = "s_idle"
	elif x < 0 and y == 0: #west
		animation.play("w_walk")
		lastDir = "w_idle"
	elif x == 0 and y < 0: #north
		animation.play("n_walk")
		lastDir = "n_idle"
	elif x > 0 and y > 0: #south east
		animation.play("se_walk")
		lastDir = "se_idle"
	elif x < 0 and y < 0: # north west
		animation.play("nw_walk")
		lastDir = "nw_idle"
	elif x > 0 and y < 0: #north east
		animation.play("ne_walk")
		lastDir = "ne_idle"
	elif x < 0 and y > 0: # south west
		animation.play("sw_walk")
		lastDir = "sw_idle"
	else:
		animation.play(lastDir)
		
		
func teleport_to_room(new_room: Area2D):
	if new_room:
		global_position = new_room.get_spawn_position()
		var camera = $Camera2D
		camera.global_position = global_position
		current_room = new_room

	

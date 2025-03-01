extends CharacterBody2D

var lastDir = "s_idle"
@onready var animation = $AnimatedSprite2D
const SPEED = 300


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
		
	

	

extends KinematicBody2D

onready var Speed_Timer = get_node("SpeedTimer")

export var choose_move_type = false
export var chosen_move_type = 0
export var choose_attack_type = false
export var chosen_attack_type = 0
export var speed_wait_time = 0.07

var dir = Vector2.ZERO
var size = 2

func _ready():
	
	randomize()
	size = round(rand_range(1, 6))
	scale = Vector2.ONE * size
	
func _process(delta):
	
	clamp_pos()
	
### MOVEMENT
	
func base_move(): # this simply moves the enemy in the dir required by the movement type
	
	position += dir

func clamp_pos():
	
	position.x = clamp(position.x, 0, 64-size)
	position.y = clamp(position.y, 0, 64-size)

func _on_SpeedTimer_timeout():
	base_move()
	
### SHOOTEMENT

func shoot(pos, speed, dir):
	
	pass

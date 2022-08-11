extends KinematicBody2D

onready var Speed_Timer = get_node("SpeedTimer")

export var choose_move_type = false
export var chosen_move_type = 0
export var choose_attack_type = false
export var chosen_attack_type = 0
export var speed_wait_time = 0.07

var dir = Vector2.ZERO

func _ready():
	
	pass
	
func _physics_process(delta):
	
	pass
	
func base_move(): # this simply moves the enemy in the dir required by the movement type
	
	
	pass
	

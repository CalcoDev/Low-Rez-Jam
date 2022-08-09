extends KinematicBody2D

var input = Vector2.ZERO
var curr_pos = Vector2.ZERO

func _ready():
	curr_pos = position

func _process(delta):
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")
	
	# go pew pew

func _physics_process(delta):	
	position += input

extends KinematicBody2D

export var speed = 64

var input = Vector2.ZERO
var curr_pos = Vector2.ZERO

func _ready():
	curr_pos = position

func _process(delta):
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")

	var force = input.normalized() * speed * delta;
	curr_pos += force
	
	curr_pos.x = round(curr_pos.x)
	curr_pos.y = round(curr_pos.y)
	
	position = curr_pos

extends KinematicBody2D

export var speed = 64

var input = Vector2.ZERO
var curr_pos = Vector2.ZERO

func _ready():
	curr_pos = position

# Limited FPS to 240 (4 * 60)
func _process(delta):
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")
	
	# go pew pew

# Limited FPS to 60 (1 * 60)
func _physics_process(delta):
	var force = input.normalized() * speed * delta;
	curr_pos += force
	
	curr_pos.x = round(curr_pos.x)
	curr_pos.y = round(curr_pos.y)
	
	position = curr_pos

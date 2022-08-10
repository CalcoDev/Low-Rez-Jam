extends KinematicBody2D

export var speed_wait_time = 0.025

var timer

var input = Vector2.ZERO
var curr_pos = Vector2.ZERO

func _ready():
	timer = get_node("PlayerTimer")
	
	curr_pos = position
	timer.wait_time = speed_wait_time

func _process(delta):
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")

func _physics_process(delta):
	alt_move_player()

func alt_move_player():
	if (input.x or input.y) and timer.is_stopped():
		timer.start()
		position += input
		
	if !input.x and !input.y and !timer.is_stopped():
		timer.stop()

func _on_PlayerTimer_timeout():
	position += input

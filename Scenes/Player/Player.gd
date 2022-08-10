# mau was here

extends KinematicBody2D

export var speed_wait_time = 0.05

var input = Vector2.ZERO
var curr_pos = Vector2.ZERO

func _ready():
	curr_pos = position
	get_node("PlayerTimer").wait_time = speed_wait_time

func _process(delta):
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")
	


func _physics_process(delta):
	
	#move_player()
	alt_move_player()
	print(get_node("PlayerTimer").time_left, " ", get_node("PlayerTimer").is_stopped())

func move_player():
	
	position += input

	
func alt_move_player():
	
	if (input.x or input.y) and get_node("PlayerTimer").is_stopped():
		get_node("PlayerTimer").start()
		position += input
		
	if !input.x and !input.y and !get_node("PlayerTimer").is_stopped():
		get_node("PlayerTimer").stop()
		
	




func _on_PlayerTimer_timeout():
	print("pro")
	position += input
	
	

extends KinematicBody2D

onready var UI = get_parent().get_node("UI")
onready var timer = get_node("PlayerTimer")

export var speed_wait_time = 0.025
export var speed_dist = 1

var input = Vector2.ZERO
var health = 3

func _ready():
	timer.wait_time = speed_wait_time

func _process(delta):
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")

	if Input.is_action_just_pressed("ui_left"):  # Just to test damage
		take_damage()
	
	clamp_to_arena()

func _physics_process(delta):
	alt_move_player()

func move_player():
	position += input

func clamp_to_arena():
	if position.x < 0:
		position.x = 0
	elif position.x > 60:
		position.x = 60
	
	if position.y < 0:
		position.y = 0
	elif position.y > 60:
		position.y = 60


func alt_move_player():
	if (input.x or input.y) and timer.is_stopped():
		timer.start()
		position += input
		
	if !input.x and !input.y and !timer.is_stopped():
		timer.stop()
		
	
func take_damage():  # lmao imagine needing this function
	health -= 1
	UI.update_health(health)
	
	#player does not die cuz it pro and itd mean some sort of menu to restart or smthing will do later

func _on_PlayerTimer_timeout():
	position += input * speed_dist

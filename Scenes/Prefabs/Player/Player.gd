extends KinematicBody2D

onready var UI = get_parent().get_node("UI")
onready var move_timer = get_node("MovementTimer")
onready var dash_delay_timer = get_node("DashDelayTimer")

export var speed_wait_time = 0.025
export var speed_dist = 1

export var dash_delay = 1 # In seconds

var dashing = false

var input = Vector2.ZERO
var health = 3

#### Lifecycle

func _ready():
	move_timer.wait_time = speed_wait_time

func _process(delta):
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")
	
	if Input.is_action_just_pressed("dash") and not dashing:
		start_dash();
	
	if Input.is_action_just_pressed("ui_left"):  # Just to test damage
		take_damage()
	
	clamp_to_arena()

func _physics_process(delta):
	if not dashing:
		move_player()

#### Movement

func move_player():
	if (input.x or input.y) and move_timer.is_stopped():
		move_timer.start()
		position += input
		
	if !input.x and !input.y and not move_timer.is_stopped():
		move_timer.stop()

func clamp_to_arena():
	if position.x < 0:
		position.x = 0
	elif position.x > 60:
		position.x = 60
	
	if position.y < 0:
		position.y = 0
	elif position.y > 60:
		position.y = 60

#### Dashing

func start_dash():
	dashing = true
	
	dash_delay_timer.start(dash_delay)
	move_timer.stop()
	
	print("started dashing")

func stop_dash():
	dashing = false
	
	dash_delay_timer.stop()
	
	print("stopped dashing")

#### Health

func take_damage():  # lmao imagine needing this function
	health -= 1
	UI.update_health(health)
	# player does not die cuz it pro and itd mean some sort of menu to restart or smthing will do later

### Timers

func _on_MovementTimer_timeout():
	position += input * speed_dist


func _on_DashDelayTimer_timeout():
	stop_dash()

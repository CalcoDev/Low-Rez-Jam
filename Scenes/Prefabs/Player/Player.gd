extends KinematicBody2D

onready var UI = get_parent().get_node("UI")
onready var move_timer = get_node("MovementTimer")
onready var dash_delay_timer = get_node("DashDelayTimer")
onready var shoot_delay_timer = get_node("ShootDelayTimer")
onready var shooting_node = get_node("ShootingNode")

export var speed_wait_time = 0.025
export var speed_dist = 1

export var dash_delay = 1 # In seconds

export var bullet_speed = 0.01

var dashing = false

var input = Vector2.ZERO
var health = 3

var can_shoot = true
var aim_dir 

#### Lifecycle

func _ready():
	move_timer.wait_time = speed_wait_time

func _process(delta):
	input.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input.y = -Input.get_action_strength("move_up") + Input.get_action_strength("move_down")
	
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
	
	position.x = clamp(position.x, 0, 61)
	position.y = clamp(position.y, 0, 61)

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

#### Shootement

func shoot():
	
	if Input.is_action_just_pressed("shoot") and can_shoot:
		
		var spn_pos = aim_dir + Vector2(1, 1)
		
		shooting_node.shoot(spn_pos, bullet_speed, aim_dir)
		can_shoot = false
		
func aim():
	
	if Input.is_action_pressed("ui_down"):
		aim_dir.y = 1
	if Input.is_action_pressed("ui_up"):
		aim_dir.y = -1
	else:
		aim_dir.y = 0
		
	if Input.is_action_pressed("ui_left"):
		aim_dir.x = -1
	if Input.is_action_pressed("ui_right"):
		aim_dir.x = 1
	else:
		aim_dir.x = 0
	
	if aim_dir == Vector2.ZERO:
		aim_dir == Vector2(0, -1)
		

#### Timers

func _on_MovementTimer_timeout():
	position += input * speed_dist


func _on_DashDelayTimer_timeout():
	stop_dash()


func _on_ShootDelayTimer_timeout():
	can_shoot = true

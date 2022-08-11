extends Node

onready var timer = get_node("Timer")

func _ready():
	
	choose_new_dir()
	
func _process(delta):
	
	check_cant_move()

	
func choose_new_dir():
	
	var dir = Vector2.ZERO
	randomize()
	
	dir.x = round(rand_range(0, 1))
	if dir.x == 0:
		dir.x = -1
	dir.y = round((rand_range(0, 1)))
	if dir.y == 0:
		dir.y = -1
	
	get_parent().dir = dir
	
	# Start timer
	
	var wait_time = rand_range(0.5, 2)
	timer.wait_time = wait_time
	timer.start()
	
func check_cant_move():
	
	var par_pos = get_parent().position
	var par_size = get_parent().size
	var par_dir = get_parent().dir
	
	if (par_pos.x == 0 or par_pos.x == 64-par_size or par_dir.y == 0) and (par_pos.y == 0 or par_pos.y == 64-par_size or par_dir.x == 0):
		
		choose_new_dir()
		
	
	
func _on_Timer_timeout():
	choose_new_dir()

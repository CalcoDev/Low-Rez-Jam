extends Control

onready var Player = get_parent().get_node("Player")

func _ready():
	
	pass
	
func update_ui():
	
	pass
	
func update_health(hp):
	
	if hp == 0:
		
		get_node("Health1").visible = false
		get_node("Health2").visible = false
		get_node("Health3").visible = false
	
	if hp == 1:
		
		get_node("Health1").visible = true
		get_node("Health2").visible = false
		get_node("Health3").visible = false
		
	if hp == 2:
		
		get_node("Health1").visible = true
		get_node("Health2").visible = true
		get_node("Health3").visible = false
		
	if hp == 3:
		
		get_node("Health1").visible = true
		get_node("Health2").visible = true
		get_node("Health3").visible = true

extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("begin_game"):
		get_tree().change_scene("res://Scenes/Stages/Game/Game.tscn")

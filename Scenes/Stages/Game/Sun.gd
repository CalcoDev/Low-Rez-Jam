extends Sprite

var animation_player

func _ready():
	animation_player = get_parent().get_node("AnimationPlayer")
	animation_player.play("sun_spinning")

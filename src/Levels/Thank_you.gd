extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Unpause.can_pause = false
	GlobalParallaxBackground.get_node("City").move_speed = -4

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		get_tree().change_scene("res://src/Levels/Menu.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

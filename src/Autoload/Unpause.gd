extends Node

var can_pause = false

func _process(delta):
	if Input.is_action_just_pressed("pause") && can_pause:
		get_tree().paused = !get_tree().paused

extends Area2D

func _on_deathArea_body_entered(body):
	if body.has_method("set_orientation"):
		get_tree().reload_current_scene() 

extends Area2D

func _on_plus_item_body_entered(body: Node) -> void:
	if body.has_method("set_orientation"):
		body.set_orientation(1)
		body.set_collision_mask_bit(4, true)
		body.set_collision_mask_bit(5, false)


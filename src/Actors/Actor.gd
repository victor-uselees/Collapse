extends KinematicBody2D
class_name Actor

export var maxspeed: = Vector2(300.0, 500.0)
export var gravity: = 600.0
var velocity: = Vector2.ZERO
const UP = Vector2(0, -1)

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, maxspeed.y)
	velocity = move_and_slide(velocity, UP)



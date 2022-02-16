extends Actor
class_name Player

export var orientation: = 1 
var facing_right = true
var walking = false
onready var _animated_sprite = get_node("AnimatedSprite")

func _ready() -> void:
	if orientation == 1:
		facing_right = true
	else:
		facing_right = false 

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 
		-0.6 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0 
	)

func set_orientation(value: int) -> void:
	orientation = value

func eliminate(value) -> void:
	value.hide()
	value.get_node("CollisionShape2D").disabled = true 

func _physics_process(delta: float) -> void:
	var direction: = get_direction() 
	if Input.is_action_pressed("move_right"):
		walking = true
		if orientation == 1:
			facing_right = true
		else:
			facing_right = false 
	else: 
		if Input.is_action_pressed("move_left"):
			walking = true
			if orientation == 1:
				facing_right = false
			else:
				facing_right = true
		else:
			walking = false  
	if facing_right:
		if orientation == 1:
			if is_on_floor():
				if walking:  
					_animated_sprite.play("walk_right_plus")
				else:
					_animated_sprite.play("idle_right_plus")
			else:
				if velocity.y >= 0: 
					_animated_sprite.play("fall_right_plus")
				else:
					_animated_sprite.play("jump_right_plus")
		else:
			if is_on_floor():
				if walking:  
					_animated_sprite.play("walk_right_minus")
				else:
					_animated_sprite.play("idle_right_minus")
			else: 
				if velocity.y >= 0: 
					_animated_sprite.play("fall_right_minus")
				else:
					_animated_sprite.play("jump_right_minus")

	else:
		if orientation == 1:
			if is_on_floor():
				if walking:  
					_animated_sprite.play("walk_left_plus")
				else:
					_animated_sprite.play("idle_left_plus")
			else:
				if velocity.y >= 0: 
					_animated_sprite.play("fall_left_plus")
				else:
					_animated_sprite.play("jump_left_plus")
		else:
			if is_on_floor():
				if walking:  
					_animated_sprite.play("walk_left_minus")
				else:
					_animated_sprite.play("idle_left_minus")
			else:
				if velocity.y >= 0: 
					_animated_sprite.play("fall_left_minus")
				else:
					_animated_sprite.play("jump_left_minus")
	velocity.x = (maxspeed.x) * direction.x * orientation
	velocity.y += (maxspeed.y) * direction.y
	#print(direction.x, is_on_floor()) 
	velocity = move_and_slide(velocity)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		#print(collision.collider.name)
		if collision.collider.has_method("set_orientation") && orientation == 1 && collision.collider.orientation == -1:
			get_parent().in_shock += 2
			eliminate(collision.collider)
			if (SaveGame.current_number == 8):
				get_parent().get_node("Camera2D").players.erase(collision.collider)
				get_parent().get_node("Camera2D").players.erase(self)
			eliminate(self)

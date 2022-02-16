extends Node

var in_shock = 0
export var players = 2
export var next_level = "res://src/Levels/level2.tscn"
export var level_number = 1

func _ready():
	Unpause.can_pause = true
	var level = self.filename
	if level != "res://src/Levels/level1.tscn":
		SaveGame.save(level, level_number)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene() 
		
	if in_shock >= players:
		get_tree().change_scene(next_level)

extends Node

var next_level = "res://src/Levels/level1.tscn"
onready var selection = get_node("NEW_GAME_SELECTED")
var last_level: String = ""



func _ready():
	Unpause.can_pause = false
	var file_manage = File.new()
	if file_manage.file_exists("user://saved_game.dat"):
		selection = get_node("LOAD_SAVE_SELECTED")
		var file: = File.new()
		file.open("user://saved_game.dat", File.READ)
		last_level = file.get_as_text()
		file_manage.close()
		
	selection.show()

func do(selection):
	if selection.name == "NEW_GAME_SELECTED":
		MusicController.play_game_music()
		GlobalParallaxBackground.get_node("City").move_speed = 0
		get_tree().change_scene(next_level)
	else: 
		if selection.name == "LOAD_SAVE_SELECTED": 
			if last_level != "":
				MusicController.play_game_music()
				get_tree().change_scene(last_level)
			else:
				 get_node("NO_SAVE").show()
		else:
			get_tree().change_scene("res://src/Levels/Controls.tscn")

func change_selection(button):
	if button == "up":
		if selection.name != "NEW_GAME_SELECTED":
			selection.hide()
		if selection.name == "LOAD_SAVE_SELECTED":
			selection = get_node("NEW_GAME_SELECTED")
		else: if selection.name == "SEE_CONTROLS_SELECTED":
			selection = get_node("LOAD_SAVE_SELECTED")
	else:
		if selection.name != "CHANGE_CONTROLS_SELECTED":
			selection.hide()
		if selection.name == "LOAD_SAVE_SELECTED":
			selection = get_node("SEE_CONTROLS_SELECTED")
		else: if selection.name == "NEW_GAME_SELECTED":
			selection = get_node("LOAD_SAVE_SELECTED")
	selection.show()

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		do(selection)
	if Input.is_action_just_pressed("ui_up"):
		change_selection("up")
	if Input.is_action_just_pressed("ui_down"):
		change_selection("down")

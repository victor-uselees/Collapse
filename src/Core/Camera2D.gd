extends Camera2D

export var playerA: NodePath = ""
export var playerB: NodePath = ""
export var playerC: NodePath = ""
export var playerD: NodePath = ""
export var fixed: bool = false 
var bottom: = Vector2.ZERO
var top: = Vector2.ZERO
var players: Array = [] 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _process(delta):
	var max_distance: float = 0
	var average_position: Vector2 = Vector2.ZERO
	for i in players:
		for j in players: 
			max_distance = max(max_distance, i.global_position.distance_to(j.global_position))
		if bottom.y > i.global_position.y:
			bottom = i.global_position 
		if top.y < i.global_position.y:
			top = i.global_position
		average_position += i.global_position
	
	if !fixed:   
		position = average_position / players.size()
		position.y = min(position.y, 0)
	if (SaveGame.current_number == 8):
		zoom = Vector2(max(1, max_distance/440), max(1, max_distance/440))
	else:
		if (SaveGame.current_number == 6): 
			zoom = Vector2(max(1, max_distance/580), max(1, max_distance/580))
		else:
			zoom = Vector2(max(1, max_distance/1200), max(1, max_distance/1200))
# Called when the node enters the scene tree for the first time.
func _ready():
	if playerA != "": players.append(get_node(playerA))
	if playerB != "": players.append(get_node(playerB))
	if playerC != "": players.append(get_node(playerC))
	if playerD != "": players.append(get_node(playerD))
	# position.x = 5 
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

tool 
extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _change_text(level_number):
	var aux: String = String(level_number)
	text = aux

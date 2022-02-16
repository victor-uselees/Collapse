extends Node

var save_number: = 1
var current_number := 1

func save(content, number):
	var file_number: = File.new()
	if file_number.file_exists("user://level_number.dat"):
		file_number.open("user://level_number.dat", File.READ)
		save_number = int(file_number.get_as_text())
	if number > save_number: 
		var file = File.new()
		file.open("user://saved_game.dat", File.WRITE)
		file_number.open("user://level_number.dat", File.WRITE)
		file.store_string(content)
		file_number.store_string(String(number))
		file.close()
	file_number.close()
	current_number = number

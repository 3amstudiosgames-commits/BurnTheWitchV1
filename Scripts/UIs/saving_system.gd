extends Node2D
 
var save_path = 'user://variable.save'
var variable1= 0
var variable2 = 0
var variable3 = 0
 
var text1
var text2
var text3
 
func _ready():
	text1 = $variable1/text1
	text2 = $variable2/text2 
	text3 = $variable3/text3
 
 
func _process(delta: float):
	text1.text = str(variable1)
	text2.text = str(variable2)
	text3.text =str(variable3)
 
 
# Buttons for var 1#
func _on_minus_var_1_pressed():
	variable1 -= 1
func _on_plus_var_1_pressed():
	variable1 += 1
 
#Buttons for var 2#
func _on_minus_var_2_pressed() -> void:
	variable2 -= 1
func _on_plus_var_2_pressed() -> void:
	variable2 +=1 
#Buttons for var 3#
func _on_minus_var_3_pressed() -> void:
	variable3 -= 1
func _on_plus_var_3_pressed() -> void:
	variable3 += 1
 
# SAVE AND LOAD-----------------------------------------------------------------------
 
func _on_save_button_pressed() -> void:
	save()

 
 
func _on_load_button_pressed() -> void:
	load_data()
func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(variable1)
	file.store_var(variable2)
	file.store_var(variable3)
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		variable1 = file.get_var(variable1)
		variable2 = file.get_var(variable2)
		variable3 = file.get_var(variable3)
	else:
		print("No Data Saved...")
		variable1 = 0
		variable2 = 0
		variable3 = 0

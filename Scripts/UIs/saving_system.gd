extends Node2D

var save_path = 'user://variable.save'

var variable1= 0
var variable2 = 0
#var variable3 = 0
 
#var text1
#var text2
#var text3
 
func _ready():
	print(" saving system ready!")

	#text1 =$variable1/text1
	#text2 = $variable2/text2
	#text3 = $variable3/text3
 
func on_time_tick(day:int, hour:int, minute:int)->void:
	variable1= "DAY" + str(day)
	variable2= "%02d:%2d" % [hour,minute]

 
func _process(delta: float):
	pass
 
 
# Func for money_amount_var 1#----------------------------------------------------
signal money(food_found: String)
var money_amount: Array[String]= []
 
#Func for days_var_2#--------------------------------------------------------------------
#func _on_day_timer_timeout() -> void:
	#variable1 +=1
	
	#print("Day finished!")
	
	#variable2 +=1 
#Func for score_var_3#---------------------------------------------------------
#func _on_minus_var_3_pressed() -> void:
	#variable3 -= 1
#func _on_plus_var_3_pressed() -> void:
	#variable3 += 1
 
# SAVE AND LOAD-----------------------------------------------------------------------
 
func start_save(on_time_tick) -> void:
	save()



#func on_exit() - void:
	#save()
	#load_data()
	#print("data load", load_data())
	
	
func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(variable1)
	file.store_var(variable1)
	#file.store_var(variable3)
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		variable1 = file.get_var(variable1)
		variable2 = file.get_var(variable2)
		print("day passed is ",variable1)
		print("time is ",variable2)
		
		#variable3 = file.get_var(variable3)
	else:
		print("No Data Saved...")
		variable1 = 0
		variable2 = 0
		#variable3 = 0

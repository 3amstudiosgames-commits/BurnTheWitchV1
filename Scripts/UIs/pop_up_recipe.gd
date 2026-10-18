extends Control
@onready var label: Label = $Label
@onready var continue_button: Button = $ContinueButton
@onready var recipe: TextureRect = $Recipe





var recipes:={
#Milkshakes
	"Apple Milkshake": preload("res://Assets/Foods/AppleMilkshake.png"),
	"Blueberry Milkshake": preload("res://Assets/Foods/BlueberryMilkshake.png"),
	"Bloodshot Eye Milkshake": preload("res://Assets/Foods/BloodshotEyeMilkshake.png"),
	"Basic Milkshake": preload("res://Assets/Cookware/Box.png"),
	"Biscuit Milkshake": preload("res://Assets/Cookware/Box.png"),
#Cakes
	"Carrot Cake": preload("res://Assets/Cookware/Box.png"),
	"Bloody Cake":preload("res://Assets/Cookware/Box.png"),
	"Crystal Cake": preload("res://Assets/Cookware/Box.png"),
	"Rainbow Cake": preload("res://Assets/Cookware/Box.png"),
	"Basic Cake":preload("res://Assets/Cookware/Box.png"),
#Puddings

#Others
	"Mess": preload("res://Assets/Cookware/Box.png")
}


func _ready() -> void:
	hide() 
func display_recipe(food_name: String) -> void:
	label.text = food_name
	if recipes.has(food_name):
		recipe.texture = recipes[food_name]
		
		
		EventBus.food_unlocked.emit(food_name)
		if not EventBus.unlocked_recipes.has(food_name):
			EventBus.unlocked_recipes.append(food_name)
		print("food name : ", food_name)
	show()

	
	
	
func display_recipe_no_recipe(food_name: String) -> void:
	label.text = food_name
	show()


func _on_continue_button_pressed() -> void:
	hide()

extends Control
@onready var label: Label = $Label
@onready var continue_button: Button = $ContinueButton
@onready var recipe: TextureRect = $Recipe

var Apple_milkshake_image= load("res://Assets/Cookware/Box.png")
var Blueberry_milkshake_image= load("res://Assets/Cookware/Box.png")
var Blood_shot_milkshake_image= load("res://Assets/Cookware/Box.png")
var basic_milkshake_image= load("res://Assets/Cookware/Box.png")
var Buscuit_Frappe_milkshake_image= load("res://Assets/Cookware/Box.png")


func _ready() -> void:
	hide() 
	if continue_button:
		continue_button.pressed.connect(hide)
		
func display_recipe(food_name: String) -> void:
	
	label.text = food_name
	show()
	if food_name == "Mess":
		recipe.texture=Apple_milkshake_image
	
	
func display_recipe_no_recipe(food_name: String) -> void:
	
	label.text = food_name
	show()

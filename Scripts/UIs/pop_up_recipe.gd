extends Control
@onready var label: Label = $Label
@onready var continue_button: Button = $ContinueButton
@onready var recipe: TextureRect = $Recipe

var recipes:={
#Milkshakes
	"Apple Milkshake"= preload("res://Assets/Cookware/Box.png"),
	"Blueberry Milkshake"= preload("res://Assets/Cookware/Box.png"),
	"Bloodshot eye Milkshake"= preload("res://Assets/Cookware/Box.png"),
	"Basic Milkshake"= preload("res://Assets/Cookware/Box.png"),
	"Biscuit Milkshake"= preload("res://Assets/Cookware/Box.png"),
#Cakes
	"Carrot Cake"= preload("res://Assets/Cookware/Box.png"),
	"Bloody Cake"= preload("res://Assets/Cookware/Box.png"),
	"Crystal Cake"= preload("res://Assets/Cookware/Box.png"),
	"Rainbow Cake"= preload("res://Assets/Cookware/Box.png"),
	"Basic Cake"=preload("res://Assets/Cookware/Box.png"),
#Others
	"Mess"= preload("res://Assets/Cookware/Box.png")
}

func _ready() -> void:
	hide() 
	if continue_button:
		continue_button.pressed.connect(hide)
		
func display_recipe(food_name: String) -> void:
	label.text = food_name
	if recipes.has(food_name):
		recipe.texture = recipes[food_name]
	show()
	
func display_recipe_no_recipe(food_name: String) -> void:
	label.text = food_name
	show()

extends Control

@onready var recipes := {
	"Blueberry Milkshake": {"button": $ScrollContainer/Recipe/MilkShakeBlueberry, "label": $ScrollContainer/Recipe/MilkShakeBlueberryLabel},
	"Apple Milkshake": {"button": $ScrollContainer/Recipe/MilkShakeApple, "label": $ScrollContainer/Recipe/MilkShakeAppleLabel},
	"Strawberry Milkshake":{"button": $ScrollContainer/Recipe/MilkShakeApple,"label": $ScrollContainer/Recipe/MilkShakeAppleLabel},
	"Bloodshot eye Milkshake":{"button": $ScrollContainer/Recipe/MilkShakeBloodshoteye,"label": $ScrollContainer/Recipe/MilkShakeBloodshoteyeLabel},
	"Basic Milkshake":{"button": $ScrollContainer/Recipe/MilkShakeBasic,"label": $ScrollContainer/Recipe/MilkShakeBasicLabel},
	"Milkshake Bicuit Frappe":{"button": $ScrollContainer/Recipe/MilkShakeBisicuitFrappe,"label": $ScrollContainer/Recipe/MilkShakeBicuitFrappeLabel},
}
var images_unlocked:={
	"Blueberry Milkshake":preload("res://Assets/Cookware/cutting_board.png"),
	"Apple Milkshake":preload("res://Assets/Cookware/cutting_board.png"),
	"Strawberry Mikshake":preload("res://Assets/Cookware/cutting_board.png"),
	"Blodshot eye Milkshake":preload("res://Assets/Cookware/cutting_board.png"),
	"Basic Milkshake":preload("res://Assets/Cookware/cutting_board.png"),
	"Milkshake Bisucit Frappe":preload("res://Assets/Cookware/cutting_board.png"),
} 

func _ready() -> void:
	print("Connected")
	EventBus.food_unlocked.connect(_on_food_unlocked)
	for recipe_name in EventBus.unlocked_recipes:
		_on_food_unlocked(recipe_name)
	print(EventBus.unlocked_recipes)

func _on_food_unlocked(food_found:String) -> void:
	if recipes.has(food_found) and images_unlocked.has(food_found):
		recipes[food_found]["button"].texture_normal = images_unlocked[food_found]
		recipes[food_found]["label"].text = food_found


func _on_texture_button_pressed() -> void:
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
		print("back to game")

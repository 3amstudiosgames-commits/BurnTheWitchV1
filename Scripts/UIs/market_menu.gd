extends Control

@onready var ingredients:={
	"AppleIngredient": preload("res://Scripts/Foods/apple_ingredient.gd"),
	"BlueberryIngredient": preload("res://Scripts/Foods/apple_ingredient.gd"),
	"StrawberryIngredient": preload("res://Scripts/Foods/apple_ingredient.gd"),
	"EyeIngredient": preload("res://Scripts/Foods/apple_ingredient.gd"),
	"MilkIngredient": preload("res://Scripts/Foods/apple_ingredient.gd"),
	"CarrotIngredient": preload("res://Scripts/Foods/apple_ingredient.gd"),
	"TofuIngredient": preload("res://Scripts/Foods/apple_ingredient.gd"),
	"FishIngredient": preload("res://Scripts/Foods/apple_ingredient.gd")
	
	}


func _on_ingredient_display_1_pressed() -> void:
	print("Ingredient 1")


func _on_ingredient_display_2_pressed() -> void:
	print("Ingredient 2")


func _on_ingredient_display_3_pressed() -> void:
	print("Ingredient 3")


func _on_ingredient_display_4_pressed() -> void:
	print("Ingredient 4")


func _on_object_display_1_pressed() -> void:
	print("Object 1")


func _on_object_display_2_pressed() -> void:
	print("Object 2")


func _on_object_display_3_pressed() -> void:
	print("Object 3")


func _on_object_display_4_pressed() -> void:
	print("Object 4")

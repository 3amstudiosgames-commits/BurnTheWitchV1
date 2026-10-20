extends Control


@onready var recipes := {
	"Blueberry Milkshake": {"button": $ScrollContainer/Recipe/MilkShakeBlueberry, "label": $ScrollContainer/Recipe/MilkShakeBlueberryLabel},
	"Apple Milkshake": {"button": $ScrollContainer/Recipe/MilkShakeApple, "label": $ScrollContainer/Recipe/MilkShakeAppleLabel},
	"Strawberry Milkshake":{"button": $ScrollContainer/Recipe/MilkShakeStrawberry,"label": $ScrollContainer/Recipe/MilkShakeStrawberryLabel},
	"Bloodshot Eye Milkshake":{"button": $ScrollContainer/Recipe/MilkShakeBloodshoteye,"label": $ScrollContainer/Recipe/MilkShakeBloodshoteyeLabel},
	"Fish Milkshake":{"button": $ScrollContainer/Recipe/MilkShakeFish,"label": $ScrollContainer/Recipe/MilkShakeFishLabel},
	"Biscuit Milkshake":{"button": $ScrollContainer/Recipe/MilkShakeBisicuitFrappe,"label": $ScrollContainer/Recipe/MilkShakeBicuitFrappeLabel},
}
var images_unlocked:={
	"Blueberry Milkshake":preload("res://Assets/Foods/BlueberryMilkshake.png"),
	"Apple Milkshake":preload("res://Assets/Foods/AppleMilkshake.png"),
	"Strawberry Milkshake":preload("res://Assets/Foods/StrawberryMilkshake.png"),
	"Bloodshot Eye Milkshake":preload("res://Assets/Foods/BloodshotEyeMilkshake.png"),
	"Fish Milkshake":preload("res://Assets/Foods/FishMilkshake.png"),
	"Biscuit Milkshake":preload("res://Assets/Foods/DogTreatMilkshake.png"),
	
} 

func _ready() -> void:
	EventBus.food_unlocked.connect(_on_food_unlocked)
	for recipe_name in EventBus.unlocked_recipes:
		_on_food_unlocked(recipe_name)
	print(EventBus.unlocked_recipes)

func _on_food_unlocked(food_found:String) -> void:
	if recipes.has(food_found) and images_unlocked.has(food_found):
		recipes[food_found]["button"].texture_normal = images_unlocked[food_found]
		recipes[food_found]["label"].text = food_found


func _on_texture_button_pressed() -> void:
		SceneTransition._transition_to_scene(SceneManager.kitchen)
		print("back to game")

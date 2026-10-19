extends Area2D

@onready var pop_up_recipe: Control = $"../../PopUpRecipe"
@export var cook_timer: float = 2.0
@onready var timer: Timer = $"../Timer"
var ingredients_in_pot: Array=[]
var is_cooking:bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"

const RECIPES: Dictionary={
	
#All Milkshakes (6)
["BlueberryIngredient","MilkIngredient"]: "Blueberry Milkshake",
["StrawberryIngredient","MilkIngredient"]:"Strawberry Milkshake", 
["AppleIngredient","MilkIngredient"]: "Apple Milkshake",
["BloodyIngredient","EyeIngredient","MilkIngredient"]: "Bloodshot Eye Milkshake",
["SugarIngredient","MilkIngredient"]: "Basic Milkshake",
["DogTreatIngredient","MilkIngredient"]: "Biscuit Milkshake",
#All Cakes (6)
["ButterIngredient", "MilkIngredient","FlourIngredient", "EggIngredient","CarrotIngredient"]: "Carrot Cake",
["ButterIngredient", "MilkIngredient","FlourIngredient", "EggIngredient","BloodVitalIngredient"]: "Bloody Cake",
["ButterIngredient", "MilkIngredient","FlourIngredient", "EggIngredient","CrystalIngredient"]: "Crystal Cake",
["ButterIngredient", "MilkIngredient","FlourIngredient", "EggIngredient","RainbowIngredient"]: "Rainbow Cake",
["ButterIngredient", "MilkIngredient","FlourIngredient", "EggIngredient"]: "Basic Cake"

#All Puddings (6)


}

func _ready() -> void:
	body_entered.connect( _on_inside_pot_body_entered) 
	timer.wait_time=cook_timer
	timer.timeout.connect(_on_timer_timeout)
	animated_sprite_2d.hide()
	
func _on_inside_pot_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ingredients") and not is_cooking:
		var ingredient_names:String=body.name 
		if body.has_method("get_ingredient_type"):
			ingredient_names =body.get_ingredient_type()
		ingredients_in_pot.append(ingredient_names)
		print("Added ingredient: ",ingredient_names)
		body.queue_free()

	if ingredients_in_pot.size()>=5:
		start_cooking()
		
func _on_button_pressed()->void:
	if ingredients_in_pot.size()>=2:
		print("start cooking")
		start_cooking()
	else:
		print("not enought ingredients")

func start_cooking() -> void:
	is_cooking = true
	timer.start()
	print("Food getting cooked..")
	animated_sprite_2d.show()
	animated_sprite_2d.play("default")
	
func _on_timer_timeout() -> void:
	print("Food is ready")
	is_cooking = false
	var result: String=checking_recipe(ingredients_in_pot)
	print("Food: ", result)
	if result != "No food":
		if pop_up_recipe.has_method("display_recipe"):
			pop_up_recipe.display_recipe(result)
		else:
			pop_up_recipe.show()
			
	elif result == "No food":
		if pop_up_recipe.has_method("display_recipe_no_recipe"):
			pop_up_recipe.display_recipe("Mess")
		else:
			pop_up_recipe.show()
	
	ingredients_in_pot.clear()
	animated_sprite_2d.stop()
	animated_sprite_2d.hide()
	
func checking_recipe(ingredients: Array) -> String: 
	var sorted_input: Array=ingredients.duplicate()
	sorted_input.sort()
	for recipes in RECIPES.keys():
		var sorted_recipe: Array=recipes.duplicate()
		sorted_recipe.sort()
		if sorted_input==sorted_recipe:
			return RECIPES[recipes]
	return "No food"

extends Node

var is_dragging=false


#Settings button states
var full_screen_control_pressed = false
var audio_control_slider = 1
var sfx_control_slider = 1


#List of all completed recipes
const completed_recipes: Array=["Blueberry Milkshake","Strawberry Milkshake", 
"Apple Milkshake","Bloodshot eye Milkshake","Fish Milkshake","Basic Milkshake",
"Biscuit Milkshake","Carrot Cake","Bloody Cake","Crystal Cake",
"Fruit Cake","Carrot Cake", "Bloody Cake", "Crystal Cake", "Rainbow Cake","Basic Cake"]


#List of completed recipes in relation to their scene file
const completed_recipe_scenes: Dictionary={
#All Milkshakes (6)
"Blueberry Milkshake": "res://Scenes/Completed Recipes/blueberry_milkshake.tscn",
"Strawberry Milkshake":"res://Scenes/Completed Recipes/strawberry_milkshake.tscn", 
"Apple Milkshake": "res://Scenes/Completed Recipes/apple_milkshake.tscn",
"Bloodshot Eye Milkshake": "res://Scenes/Completed Recipes/bloodshot_eye_milkshake.tscn",
"Fish Milkshake": "res://Scenes/Completed Recipes/fish_milkshake.tscn",
"Biscuit Milkshake": "res://Scenes/Completed Recipes/biscuit_milkshake.tscn",
#All Cakes (6)
"Fruit Cake": "res://Scenes/Completed Recipes/fruit_cake.tscn",
"Carrot Cake": "res://Scenes/Completed Recipes/carrot_cake.tscn",
"Bloody Cake": "res://Scenes/Completed Recipes/bloody_cake.tscn",
"Crystal Cake": "res://Scenes/Completed Recipes/crystal_cake.tscn",
"Rainbow Cake": "res://Scenes/Completed Recipes/rainbow_cake.tscn",
"Basic Cake": "res://Scenes/Completed Recipes/basic_cake.tscn"
#All Puddings (6)


}



#Keep track of if a customer is waiting for food or not
var line_spot_1_occupied = false

#Charatcer order
var order: Array=[]

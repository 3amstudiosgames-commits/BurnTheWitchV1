extends Node2D

@onready var main_menu = load("res://Scenes/UIs/main_menu.tscn").instantiate()
@onready var kitchen = load("res://Scenes/game.tscn").instantiate()
@onready var front_counter = load("res://Scenes/front_counter.tscn").instantiate()
@onready var recipe_menu = load("res://Scenes/UIs/recipes_menu.tscn").instantiate()

@onready var current_scene: Node =  main_menu

var ui_layer: CanvasLayer 


func _ready() -> void:
	ui_layer = CanvasLayer.new()
	add_child(ui_layer)
	ui_layer.add_child(current_scene)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func switch_scene(new_scene_name: Node) -> void:
	ui_layer.remove_child(current_scene)
	
	#swap
	current_scene = new_scene_name
	
	ui_layer.add_child(current_scene)

func add_scene(new_scene_name: Node) -> void:
	current_scene = new_scene_name
	ui_layer.add_child(current_scene)


func remove_scene(new_scene_name: Node) -> void:
	current_scene = new_scene_name
	ui_layer.remove_child(current_scene)

func add_recipe(recipe_name: PackedScene) -> void:
	var unpacked_scene = recipe_name.instantiate()
	front_counter.add_child(unpacked_scene)
	unpacked_scene.global_position = Vector2(425,380)


#when you cook a valid recipe add in the corresponding child node scene
func add_recipe_to_scene(scene_name: String):
	#Corresponds the string name to its tscn file
	if Global.completed_recipe_scenes[scene_name]:
		if Global.completed_recipe_scenes[scene_name] != "":
			var scene_file = load(Global.completed_recipe_scenes[scene_name])
			SceneManager.add_recipe(scene_file)
			print("Spawned ", scene_name)
	
		else:
			print("No scene file for recipe")
	else:
		print("Invalid key name")

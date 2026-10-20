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

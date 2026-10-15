extends Node2D


func _on_kitchen_button_pressed() -> void:
	print("Kitchen button pressed")
	SceneTransition._transition_to_scene("res://Scenes/game.tscn")


func _on_menu_button_pressed() -> void:
	SceneTransition._transition_to_scene("res://Scenes/UIs/main_menu.tscn")

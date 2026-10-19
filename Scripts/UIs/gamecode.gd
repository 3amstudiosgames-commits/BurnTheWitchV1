extends Node2D



func _on_recipe_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UIs/recipes_menu.tscn")


func _on_to_counter_button_pressed() -> void:
	SceneTransition._transition_to_scene(SceneManager.front_counter)

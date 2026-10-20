extends Node2D



func _on_recipe_menu_button_pressed() -> void:
	SceneTransition._transition_to_scene(SceneManager.recipe_menu)


func _on_to_counter_button_pressed() -> void:
	SceneTransition._transition_to_scene(SceneManager.front_counter)

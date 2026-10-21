extends Node2D




func _on_kitchen_button_pressed() -> void:
	SceneTransition.left_slide_transition_to_scene(SceneManager.kitchen, SceneManager.front_counter)

extends Node2D




func _on_kitchen_button_pressed() -> void:
	SceneTransition._transition_to_scene(SceneManager.kitchen)

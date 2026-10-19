extends Control

@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var settings: Panel = $Settings



func _process(delta: float) -> void:
	pass

func _ready() -> void:
	main_buttons.visible = true
	settings.visible = false

func _on_start_game_pressed() -> void:
	print("Start Pressed")
	SceneTransition._transition_to_scene(SceneManager.kitchen)


func _on_settings_pressed() -> void:
	print("Settings Pressed")
	main_buttons.visible = false
	settings.visible = true

func _on_quit_pressed() -> void:
	print("Quit Pressed")
	get_tree().quit()

func _on_back_settings_pressed() -> void:
	_ready()

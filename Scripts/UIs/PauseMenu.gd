extends Control

@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var settings: Panel = $Settings
@onready var GamePausedLabel = $Label
@onready var PauseMenuState = false

func _ready() -> void:
	main_buttons.visible = false
	settings.visible = false
	GamePausedLabel.visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Escape"):
			main_buttons.visible = true
			GamePausedLabel.visible = true

func _on_resume_game_pressed() -> void:
	print("Resume game")
	_ready()

func _on_settings_pressed() -> void:
	print("Settings Pressed")
	main_buttons.visible = false
	settings.visible = true

func _on_quit_pressed() -> void:
	print("Quit Pressed")
	get_tree().quit()

func _on_back_settings_pressed() -> void:
	main_buttons.visible = true
	settings.visible = false

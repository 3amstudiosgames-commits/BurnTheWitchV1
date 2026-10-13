extends Control

@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var settings: Panel = $Settings
@onready var GamePausedLabel = $Label

@onready var pause_menu: Control = $"."


func _ready() -> void:
	main_buttons.visible = false
	settings.visible = false
	GamePausedLabel.visible = false
	get_tree().paused = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Escape") and GamePausedLabel.visible ==false:
		print("Escape pressed in")
		main_buttons.visible = true
		GamePausedLabel.visible = true
		get_tree().paused = true
	elif Input.is_action_just_pressed("Escape") and GamePausedLabel.visible ==true:
		print("Escape pressed out")
		_ready()


	elif GamePausedLabel.visible ==true and Input.is_action_just_pressed("Escape"):
		print("Escape pressed out")
		_ready()

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

func _on_return_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UIs/main_menu.tscn")

extends CanvasLayer

@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var settings: Panel = $Settings
@onready var GamePausedLabel = $Label

@onready var pause_menu: CanvasLayer = $"."


func _ready() -> void:
	main_buttons.visible = false
	settings.visible = false
	GamePausedLabel.visible = false
	get_tree().paused = false
	


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Escape") and GamePausedLabel.visible ==false:
		main_buttons.visible = true
		GamePausedLabel.visible = true
		get_tree().paused = true
		


	elif Input.is_action_just_pressed("Escape") and GamePausedLabel.visible ==true:
		_ready()


	elif GamePausedLabel.visible ==true and Input.is_action_just_pressed("Escape"):
		_ready()

func _on_resume_game_pressed() -> void:
	_ready()

func _on_settings_pressed() -> void:
	main_buttons.visible = false
	settings.visible = true

func _on_quit_pressed() -> void:
	print("Quit Pressed")
	get_tree().quit()

func _on_back_settings_pressed() -> void:
	main_buttons.visible = true
	settings.visible = false

func _on_return_main_menu_pressed() -> void:
	SceneTransition._transition_to_scene(SceneManager.main_menu)

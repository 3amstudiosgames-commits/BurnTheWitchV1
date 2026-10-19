extends Control

@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var settings: Panel = $Settings
@onready var GamePausedLabel = $Label

@onready var pause_menu: Control = $"."

#@onready var text_bubble_layer: DialogicLayoutLayer = $"."



func _ready() -> void:
	main_buttons.visible = false
	settings.visible = false
	GamePausedLabel.visible = false
	get_tree().paused = false
	
	#if "res://Dialogic/TextbubbleLayer/custom_textbubble_layer.tscn":
		#text_bubble_layer.visible = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Escape") and GamePausedLabel.visible ==false:
		print("Escape pressed in")
		main_buttons.visible = true
		GamePausedLabel.visible = true
		get_tree().paused = true
		
		#if "res://Dialogic/TextbubbleLayer/custom_textbubble_layer.tscn":
			#text_bubble_layer.visible = false

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
	SceneTransition._transition_to_scene(SceneManager.main_menu)

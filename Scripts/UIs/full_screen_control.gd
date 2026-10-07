extends CheckButton

func _ready() -> void:
	$".".button_pressed = Global.full_screen_control_pressed


func _on_toggled(toggled_on: bool) -> void:
	Global.full_screen_control_pressed = $".".button_pressed
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	

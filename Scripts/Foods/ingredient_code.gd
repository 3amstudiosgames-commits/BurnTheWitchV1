class_name ingredientscode
extends RigidBody2D


var dragging = false
var offset = Vector2.ZERO

#sleep, (state)
func _physics_process(_delta):

	if dragging:
		var target_position = get_global_mouse_position() - offset
		linear_velocity = (target_position - global_position) * 25.0
		
func _on_button_button_down() -> void:
	dragging = true
	offset = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	dragging = false

	

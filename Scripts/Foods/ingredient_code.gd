class_name ingredientscode
extends RigidBody2D

@export var max_drag_distance: float = 250.0
@export var follow_speed: float = 25.0
@export var max_speed: float = 800.0

var dragging = false
var offset = Vector2.ZERO

func _physics_process(delta):
	if dragging:
		var target_position = get_global_mouse_position() - offset
		var distance = global_position.distance_to(target_position)
		
		if distance > max_drag_distance:
			dragging = false
			return
		var smoothed_position = global_position.lerp(target_position, follow_speed * delta)
		linear_velocity = (smoothed_position - global_position) / delta

func _on_button_button_down() -> void:
	dragging = true
	sleeping=false
	offset = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	dragging = false

	

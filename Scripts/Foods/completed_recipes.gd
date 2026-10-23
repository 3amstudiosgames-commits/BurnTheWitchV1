class_name completedrecipes
extends RigidBody2D

@export var max_drag_distance: float = 400.0
@export var follow_speed: float = 25.0
@export var max_speed: float = 900.0

var dragging = false
var offset = Vector2.ZERO
var original_gravity_scale: float

		
func _ready() -> void:
	original_gravity_scale = gravity_scale
func _physics_process(delta):
	if dragging:
		var target_position = get_global_mouse_position() - offset
		var smoothed_position = global_position.lerp(target_position, follow_speed * delta)
		linear_velocity = (smoothed_position - global_position) / delta
		if linear_velocity.length()>max_speed:
			linear_velocity=linear_velocity.normalized()*max_speed
			
func _on_button_button_down() -> void:
	dragging = true
	sleeping=false 
	gravity_scale=0.0
	linear_velocity=Vector2.ZERO
	offset = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	dragging = false
	gravity_scale=original_gravity_scale
	

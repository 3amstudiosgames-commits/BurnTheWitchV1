extends CanvasLayer

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var canvas_layer: CanvasLayer = $"."

var slide_tween = Tween
var screen_width: float = ProjectSettings.get_setting("display/window/size/viewport_width")

#for slide transition
var center_of_screen: Vector2 = Vector2.ZERO
var right_of_screen: Vector2 = Vector2(screen_width, 0)
var left_of_screen: Vector2 = Vector2(-screen_width, 0)


func _ready() -> void:
	canvas_layer.visible = false

#fade transition
func _transition_to_scene(target_scene_path: Node) -> void:
	
	canvas_layer.visible = true
	
	#start animation
	if animation_player:
		animation_player.play("Fade")
		await animation_player.animation_finished
	
	SceneManager.switch_scene(target_scene_path)
	
	#finish animation
	if animation_player:
		animation_player.play_backwards("Fade")
		await animation_player.animation_finished
	
	canvas_layer.visible = false
	
#Counter scene to center from right side
func right_slide_transition_to_scene(new_scene_name: Node, current_scene_name: Node) -> void:
	SceneManager.add_scene(new_scene_name)
	new_scene_name.global_position =  right_of_screen
	 
	slide_tween = create_tween().set_parallel(true)
	slide_tween.tween_property(current_scene_name, "position", left_of_screen, 1.0)
	slide_tween.tween_property(new_scene_name, "position", center_of_screen, 1.0)
	await slide_tween.finished
	
	SceneManager.remove_scene(current_scene_name)

#Kitchen scene to center from left side
func left_slide_transition_to_scene(new_scene_name: Node, current_scene_name: Node) -> void:
	SceneManager.add_scene(new_scene_name)
	new_scene_name.global_position =  left_of_screen
	 
	slide_tween = create_tween().set_parallel(true)
	slide_tween.tween_property(current_scene_name, "position", right_of_screen, 1.0)
	slide_tween.tween_property(new_scene_name, "position", center_of_screen, 1.0)
	await slide_tween.finished
	
	SceneManager.remove_scene(current_scene_name)

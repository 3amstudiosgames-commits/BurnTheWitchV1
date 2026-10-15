extends CanvasLayer

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var canvas_layer: CanvasLayer = $"."


func _ready() -> void:
	canvas_layer.visible = false

func _transition_to_scene(target_scene_path: String) -> void:
	
	canvas_layer.visible = true
	
	#start animation
	if animation_player:
		print("animation player exists")
		animation_player.play("Fade")
		await animation_player.animation_finished
	
	get_tree().change_scene_to_file(target_scene_path)
	await get_tree().process_frame
	
	#finish animation
	if animation_player:
		animation_player.play_backwards("Fade")
		await animation_player.animation_finished
	
	canvas_layer.visible = false
	

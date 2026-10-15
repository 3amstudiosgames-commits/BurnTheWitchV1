extends ColorRect
@onready var animation_player: AnimationPlayer = %AnimationPlayer

	

func _transition_to_scene(target_scene_path: String) -> void:
	#start animation
	animation_player.play("Fade")
	await animation_player.animation_finished

	#start loading scene
	ResourceLoader.load_threaded_request(target_scene_path)
	var status = ResourceLoader.load_threaded_request(target_scene_path)

	#if scene is ready, load scene
	if status == ResourceLoader.THREAD_LOAD_LOADED:
		var loaded_scene = ResourceLoader.load_threaded_get(target_scene_path) as PackedScene
		loaded_scene.instantiate()
	
	#finish animation
	animation_player.play_backwards("Fade")
	await animation_player.animation_finished
	
	

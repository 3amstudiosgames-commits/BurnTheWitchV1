extends HSlider

@export var audio_bus_name: String
@export var db = linear_to_db(value)
var audio_bus_id


func _ready() -> void:
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	
	value = Global.sfx_control_slider


func _on_value_changed(value: float) -> void:
	db = linear_to_db(value)
	
	AudioServer.set_bus_volume_db(audio_bus_id, db)
	
	Global.sfx_control_slider = value

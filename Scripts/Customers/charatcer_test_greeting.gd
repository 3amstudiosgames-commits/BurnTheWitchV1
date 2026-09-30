extends Node2D

var in_tween: Tween

@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D
@onready var in_marker_2d: Marker2D = %InMarker2D
@onready var out_marker_2d: Marker2D = %OutMarker2D
@onready var speech_bubble_marker_2d: Marker2D = %SpeechBubbleMarker2D


func _ready() -> void:
	await _in_tween()
	await _inital_timeline()
	_out_tween()


func _inital_timeline():
	#Dialogic
	var layout = Dialogic.Styles.load_style("text_bubble_style")
	var character_resource = load("res://Dialogic/Characters/character_test.dch")
	layout.register_character(character_resource, speech_bubble_marker_2d)
	Dialogic.start("Test")
	
	await Dialogic.timeline_ended


func _in_tween():
	#in tween
	if in_tween: in_tween.kill() #if tween exists kill it
	in_tween = create_tween()
	in_tween.tween_property(sprite_2d, "position", in_marker_2d.position, 1.0)
	
	await in_tween.finished

func _out_tween():
	#out tween
	if in_tween: in_tween.kill() #if tween exists kill it
	in_tween = create_tween()
	in_tween.tween_property(sprite_2d, "position", out_marker_2d.position, 1.2)

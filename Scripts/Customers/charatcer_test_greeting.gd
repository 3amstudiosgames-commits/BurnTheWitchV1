extends Node2D

var in_tween: Tween
var food_recieved: Array=[]
var order: Array=["MilkIngredient", "BluberryIngredient"]



@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D
@onready var line_spot_1: Marker2D = %LineSpot1
@onready var out_marker_2d: Marker2D = %OutMarker2D
@onready var speech_bubble_marker_2d: Marker2D = %SpeechBubbleMarker2D



func _ready() -> void:
	await _in_tween()
	await _inital_timeline()
	


func _inital_timeline():
	#Dialogic
	var layout = Dialogic.Styles.load_style("text_bubble_style")
	var character_resource = load("res://Dialogic/Characters/character_test.dch")
	layout.register_character(character_resource, speech_bubble_marker_2d)
	Dialogic.start("customer_order")
 
	await Dialogic.timeline_ended

func _in_tween():
	#in tween
	if Global.line_spot_1_occupied == false:
		Global.line_spot_1_occupied = true
		if in_tween: in_tween.kill() #if tween exists kill it
		in_tween = create_tween().set_parallel(true)
		in_tween.tween_property(sprite_2d, "position", line_spot_1.position, 1.0)
		in_tween.tween_property(collision_shape_2d, "position", line_spot_1.position, 1.0)
		await in_tween.finished

func _out_tween():
	#out tween
	if in_tween: in_tween.kill() #if tween exists kill it
	in_tween = create_tween().set_parallel(true)
	in_tween.tween_property(sprite_2d, "position", out_marker_2d.position, 1.2)
	in_tween.tween_property(collision_shape_2d, "position", out_marker_2d.position, 1.2)


func _on_customer_hitbox_entered(body: Node2D) -> void:
	if body.name in Global.completed_recipes:
		food_recieved.append(str(body.name))
		food_recieved.sort()
		order.sort()
		body.queue_free()
		print(food_recieved)

		if food_recieved == order:
			Dialogic.start("order_right")
			await Dialogic.timeline_ended
			_out_tween()

		elif body.name not in order:
			food_recieved.pop_back()
			print(food_recieved)
			Dialogic.start("order_wrong")

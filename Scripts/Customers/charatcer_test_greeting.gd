extends Node2D

var in_tween: Tween
var food_recieved: Array=[]
var order_range = randi_range(1,2)
var food_still_needed: Array = []

@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D
@onready var line_spot_1: Marker2D = %LineSpot1
@onready var out_marker_2d: Marker2D = %OutMarker2D
@onready var speech_bubble_marker_2d: Marker2D = %SpeechBubbleMarker2D

@onready var customer_base: Node2D = $"."

const customer_neutral = preload("uid://dmvyjmohsm1qq")
const kitsune_neutral = preload("res://Assets/Customers/Kitsune/kitsune_neutral.png")

const customer_sprites: Array = [customer_neutral, kitsune_neutral]

func _ready() -> void:
	_spawn_customer()
	food_still_needed = Global.order
	
	sprite_2d.texture = customer_sprites.pick_random()



func _spawn_customer() -> void:
	Global.order.clear()
	food_recieved.clear()
	if Global.line_spot_1_occupied == false:
		#gets a random order, 1 to x items
		print("Spawned customer")
		for i in range(order_range):
			Global.order.append(Global.completed_recipes.pick_random())
			print("Order is:", Global.order)
		
		await _in_tween()
		await _inital_timeline()
		Global.line_spot_1_occupied = true

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
		if in_tween: in_tween.kill() #if tween exists kill it
		in_tween = create_tween().set_parallel(true)
		in_tween.tween_property(sprite_2d, "position", line_spot_1.position, 1.0)
		#in_tween.tween_property(collision_shape_2d, "position", line_spot_1.position, 1.0)
		await in_tween.finished
		

func _out_tween():
	#out tween
	if in_tween: in_tween.kill() #if tween exists kill it
	in_tween = create_tween().set_parallel(true)
	in_tween.tween_property(sprite_2d, "position", out_marker_2d.position, 1.2)
	#in_tween.tween_property(collision_shape_2d, "position", out_marker_2d.position, 1.2)
	
	await in_tween.finished
	
	Global.line_spot_1_occupied = false
	customer_base.position = Vector2(0,0)
	_spawn_customer()


func _on_customer_hitbox_entered(body: RigidBody2D) -> void:
	print("Customer hitbox entered: ", body.get_recipe_name())
	
	if body.has_method("get_recipe_name"):
		if body.get_recipe_name() in Global.completed_recipes:
			if body.get_recipe_name() in food_still_needed:
				food_recieved.append(str(body.get_recipe_name()))
				food_recieved.sort()
				Global.order.sort()
				body.queue_free()
				food_still_needed.erase(body.get_recipe_name())
				print(food_recieved)

				if food_recieved == Global.order:
					Dialogic.start("order_right")
					await Dialogic.timeline_ended
					_out_tween()

			elif body.get_recipe_name() not in Global.order:
				food_recieved.pop_back()
				print(food_recieved, Global.order)
				Dialogic.start("order_wrong")


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		Dialogic.start("restate_order")
		await Dialogic.timeline_ended

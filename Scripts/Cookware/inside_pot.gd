extends Area2D

@export var cook_time: float = 3.0
@onready var timer: Timer = $"../Timer"

var current_ingredients: Array=[]
var is_cooking:bool = false

func _ready() -> void:
	body_entered.connect( _on_inside_pot_body_entered) 
	timer.wait_time = cook_time
	timer.timeout.connect(_on_timer_timeout)
	
func _on_inside_pot_body_entered(body: Node2D) -> void:
	if body.is_in_group("Ingredients") and not is_cooking:
		current_ingredients.append(body.name)
		body.queue_free()
		print("Added ingredient: ", body.name)
	
	#cook if there is 5 ingredients in pot
	if current_ingredients.size() >=5:
		start_cooking()
		
func start_cooking() -> void:
	timer.start()
	is_cooking = true
	print("cooking...")
	
func _on_timer_timeout() -> void:
	print("Food is ready")
	is_cooking = false

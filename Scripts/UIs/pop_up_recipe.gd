extends Control
@onready var label: Label = $Label
@onready var continue_button: Button = $ContinueButton


func _ready() -> void:
	hide() 
	if continue_button:
		continue_button.pressed.connect(hide)
		
func display_recipe(food_name: String) -> void:
	
	label.text = "You found:" + food_name
	show()

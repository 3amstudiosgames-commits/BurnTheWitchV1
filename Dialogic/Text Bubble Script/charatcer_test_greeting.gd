extends Node2D


func _ready() -> void:
	var layout = Dialogic.Styles.load_style("text_bubble_style")
	
	var character_resource = load("res://Dialogic/Characters/character_test.dch")
	
	layout.register_character(character_resource, $customer/Marker2D)
	
	Dialogic.start("Test")



func _process(delta: float) -> void:
	pass

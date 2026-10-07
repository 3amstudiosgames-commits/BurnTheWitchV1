extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Color(Color.REBECCA_PURPLE,7.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.is_dragging:
		visible=true
	else:
		visible=false

extends Node2D


var xPos

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	if(round(rand_range(0,1)) == 1):
		xPos = 360
	else:
		xPos = 735
		scale.x = -1
		



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position.y += Global.screenSpeed
	position.x = xPos
	
	if position.y > 700:
		queue_free()
	

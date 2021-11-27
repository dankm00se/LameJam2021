extends Node2D


var xPos

# Called when the node enters the scene tree for the first time.
func _ready():

	if(round(rand_range(0,1)) == 1):
		xPos = 360
	else:
		xPos = 735
		scale.x = -1
	position.y = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position.y += 0.2
	position.x = xPos
	

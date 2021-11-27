extends TileMap


var xPos
# Called when the node enters the scene tree for the first time.
func _ready():
	xPos = rand_range(400, 700)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position.y += 0.2
	position.x = xPos

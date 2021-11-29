extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var count = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _process(delta):
	position.x += 0.01 * count
	if position.x > 477: #this is so it doesn't swing left forever
		count -= 2
	if position.x < 457:
		count += 2
	position.y += Global.screenSpeed /2
	

func _on_Timer_timeout():
	#it should be outside the screen by now
	pass

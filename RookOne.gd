extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _process(delta):
	#if position.x < 565: #this should make it swing to the right a bit
	#	position.x += 1
	#if position.x < 535: #this is so it doesn't swing left forever
	#	position.x += 1
	#else: #this should make it swing left after it went right enough
	#	position.x -= 1
	position.y += Global.screenSpeed /2
	

func _on_Timer_timeout():
	#it should be outside the screen by now
	pass

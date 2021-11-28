extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	$backmount.position.y += 0.0001
	$backmount/backpeaks.position.y += 0.001
	$backmount/backpeaks/backtrees.position.y += 0.01
	#the way it works is: you attack the father to the camera, it is fixed to the player view
	#it's children slowly go down as the game goes
	#it looks like the player is going up and seying from a different angle

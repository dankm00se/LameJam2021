extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 550
	position.y = -3000


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= 0.1
	$AnimationPlayer.play("idle")




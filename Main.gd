extends Node2D
var screenSpeed = 0.2



# Called when the node enters the scene tree for the first time.
func _ready():
	print("Player Cam: " , $PlayerCam.position.y)
	print("Player: " , $Player.position.y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PlayerCam.position.y -= screenSpeed #Small fix but could be better?
	
	if $Player.position.y - $PlayerCam.position.y > 675:
		$Fade.color.a += 0.01
		#Set timer for 1 second. If this is still true after 1 sec, kill player
	else:
		#reset timer
		$Fade.color.a = 0
	
	#If player is off screen change screen to gameover
	if $Fade.color.a > 1.5:
		get_tree().change_scene("res://GameOver.tscn")





func _on_Slime_body_entered(body):
	if body == $Player:
		get_tree().change_scene("res://Win.tscn")


func _on_IncreaseSpeed_timeout():
	screenSpeed += 0.1
	$IncreaseSpeed.start(10)

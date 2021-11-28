extends Control
var fade = false
var start = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Button_pressed():
	fade = true
	start = true
	$Button/Start.play()
	$AudioStreamPlayer.stop()
	

func _process(_delta):
	if fade == true:
		$ColorRect.color.a += 0.01
		if $ColorRect.color.a > 3.5 && start:
			get_tree().change_scene("res://Main.tscn")
		


func _on_HowToPlay_pressed():
	$Popup.visible = !$Popup.visible
	
	

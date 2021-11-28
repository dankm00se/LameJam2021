extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("esc"):
		get_tree().quit()
	if Input.is_action_pressed("left_click"):
		Global.level += 1
		if Global.level > 3:
			Global.level = 1
		get_tree().change_scene("res://Main.tscn")

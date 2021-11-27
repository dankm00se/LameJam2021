extends Camera2D

var Platform = preload("res://Platform.tscn")
var Platform_pipe = preload("res://Platform_Pipe.tscn")

var platforms = [Platform, Platform_pipe]

var Wall = preload("res://wall.tscn")


# Called when the node enters the scene tree for the first time.
func spawn_right_wall():
	var Wall_node = Wall.instance()
	Wall_node.position.x = 740
	Wall_node.position.y = 592
	
	add_child(Wall_node)
	#print("spawned wall")

func spawn_left_wall():
	var Wall_node = Wall.instance()
	Wall_node.position.x = 358
	Wall_node.position.y = 592
	
	add_child(Wall_node)
	#print("spawned wall")



func _ready():
	$Timer.start(2)
	spawn_right_wall()
	spawn_left_wall()
	$right_wallTimer.start(2)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Timer_timeout():
	var randomIndex = rand_range(0, platforms.size())
	var Platform_node = platforms[randomIndex].instance()
	add_child(Platform_node)
	$Timer.start(2)



func _on_right_wallTimer_timeout():
	spawn_right_wall()
	spawn_left_wall()
	$right_wallTimer.start(2)


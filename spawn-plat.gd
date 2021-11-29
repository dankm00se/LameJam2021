extends Camera2D

#Level 1 assets
var Platform = preload("res://Platform.tscn")
var Platform_pipe = preload("res://Platform_Pipe.tscn")
var PlatformB = preload("res://DARKPlatform_B.tscn")
var PlatformI = preload("res://DARKplatform_I.tscn")
var PlatformL = preload("res://DARKplatform_L.tscn")
var PlatformT = preload("res://DARKplatform_T.tscn")
#var PlatformSmall = preload("res://DARKplatform_smallblock2.tscn")
export var time_alive = 0


#var platforms = [Platform, PlatformB, PlatformI, PlatformL, PlatformT]


#Level 2 assets


#Level 3 assets

#Global assets
#Have to change colour of walls based on level
var Wall = preload("res://wall.tscn")

var currentPlatforms = []


# Called when the node enters the scene tree for the first time.
#func spawn_right_wall():
#	var Wall_node = Wall.instance()
#	Wall_node.position.x = 740
#	Wall_node.position.y = 590
	
	#if Global.level == 2:
	#	Wall_node.set_modulate(Color(23, 244, 103))
#	add_child(Wall_node)
	#print("spawned wall")

#func spawn_left_wall():
#	var Wall_node = Wall.instance()
#	Wall_node.position.x = 358
#	Wall_node.position.y = 590
#	add_child(Wall_node)
	#print("spawned wall")



func _ready():
	$Timer.start(2)
#	spawn_right_wall()
#	spawn_left_wall()
	$right_wallTimer.start(1)
	$Score_timer.start(1)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#This for loop checks if the platform deleted itself, and if it did removes it from the currentPlatforms array.
	#This is important so we can have an updated list of currentPlatforms for spawning new ones.
	for platform in currentPlatforms:
		if !is_instance_valid(platform):
			currentPlatforms.erase(platform)
	
func get_currentPlatforms():
	return currentPlatforms

func _on_Timer_timeout():
	#var randomIndex = round(rand_range(0, platforms.size() - 1))
	#var Platform_node = platforms[randomIndex].instance()
	#Platform_node.platform_type = randomIndex
	
	var Platform_node = Platform.instance()
	add_child(Platform_node)
	currentPlatforms.append(Platform_node)
	$Timer.start(1 - Global.screenSpeed)



func _on_right_wallTimer_timeout():
#	spawn_right_wall()
#	spawn_left_wall()
	$right_wallTimer.start(1.2 - Global.screenSpeed)
	


func _on_Pipe_timer_timeout():
	randomize()
	var Pipe_node = Platform_pipe.instance()
	add_child(Pipe_node)
	$Pipe_timer.start(rand_range(5, 10))


func _on_Score_timer_timeout():
	$Score_timer.start (1)
	time_alive += 10
	$Label.text = "Score: " + time_alive as String

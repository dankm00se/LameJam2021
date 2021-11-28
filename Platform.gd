extends TileMap


var xPos
var yPos
var currentPlatforms = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	currentPlatforms = get_parent().call("get_currentPlatforms")
	
	#If the array is empty then initialize the first platform in any range
	if currentPlatforms.empty():
		xPos = 550
		return

	var highestPlatform = currentPlatforms[currentPlatforms.size() - 1]
	
	#find the highest platform so we can create a new platform that's reachable
	for platform in currentPlatforms:
		if !is_instance_valid(platform):
			break
		if highestPlatform == null:
			highestPlatform = platform
		elif platform.position.y < highestPlatform.position.y:
			highestPlatform = platform
			
	#Calculate new xPosition based on the xPosition of the highest platform
	if !is_instance_valid(highestPlatform):
			return

	
	if (highestPlatform.position.x - 100 < 400):
		xPos = rand_range(highestPlatform.position.x, highestPlatform.position.x + 100)
	elif (highestPlatform.position.x + 100 > 700):
		xPos = rand_range(highestPlatform.position.x - 100, highestPlatform.position.x)
	else:
		xPos = rand_range(highestPlatform.position.x - 100, highestPlatform.position.x + 100)
	
	
	xPos = clamp(xPos, 400, 700)
	
	yPos = rand_range(highestPlatform.position.y - 100, highestPlatform.position.y - 40)
	
	position.y = yPos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position.y += Global.screenSpeed
	if xPos == null:
		xPos = 550
	position.x = xPos
	
	if position.y > 700:
		queue_free()



func _on_Area2D_body_entered(body):
	if body == $Player and $Player.isMoving():
		$AudioStreamPlayer2D.play()
	

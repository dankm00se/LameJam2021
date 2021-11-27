extends KinematicBody2D

const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 80
const ACCEL = 10
const JUMPFORCE = 400


export var up = Vector2(0, -1)

var motion = Vector2()
var facing_right = true
var can_double_jump = true
var already_jumped = false


func _ready():
	pass

#TODO: Handle wall running for character.
#TODO: Get better character
#TODO: Replace Background



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	
	
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		facing_right = true
		$AnimationPlayer.play("run")
		
	elif Input.is_action_pressed("left"):
		motion.x += -ACCEL
		facing_right = false
		$AnimationPlayer.play("run")
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		$AnimationPlayer.play("idle")
	
	#There's a bug when falling the first jump isn't registered
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			motion.y = -JUMPFORCE
		else:
			can_double_jump = false
			already_jumped = false
	else:
		if Input.is_action_just_released("jump"):
			can_double_jump = true
		elif Input.is_action_pressed("jump") and can_double_jump == true && !already_jumped:
			can_double_jump = false
			already_jumped = true
			motion.y = -JUMPFORCE
	
	
	if !is_on_floor():
		if motion.y < 0:
			$AnimationPlayer.play("jump")

		elif motion.y > 0:
			$AnimationPlayer.play("fall")
	
	
	motion = move_and_slide(motion, up)
	

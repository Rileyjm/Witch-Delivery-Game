extends CharacterBody2D

var speed = 0
@export var walk = 300
@export var sprintSpeed = 450
const maxSpeed =450
const  friction = 750
const accl = 1600

var input = Vector2.ZERO



	
func _physics_process(delta):
	player_movement(delta)
	
	if velocity == Vector2.ZERO:
		pass
	else:
		$Sprite2D/AnimationTree.set("parameters/BlendSpace2D/blend_position",velocity)

	if Input.is_action_pressed("run"):
		speed = sprintSpeed
	else:
		speed = walk
	
func get_input():
	input.x = int(Input.is_action_pressed("right"))- int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down"))- int(Input.is_action_pressed("up"))
	return input.normalized()
	
func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length()> (friction * delta):
			velocity-= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accl * delta)
		velocity = velocity.limit_length(speed)

	move_and_slide()

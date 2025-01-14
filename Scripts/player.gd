extends CharacterBody2D

@onready var enemy = $pawn
@onready var pauseMenu = $Pause
var paused
var speed = 0
@export var walk = 300
@export var sprintSpeed = 450
const maxSpeed =450
const  friction = 750
const accl = 1600
@onready var atk = $atkArea
var input = Vector2.ZERO
var pawnInArea = false
var damageE = false

var health = 100
var maxHealth = 100
var playerAlive = true

@onready var enemyInArea = false
var enemyAttackCooldown = true
var attackCooldown = true

signal healthChanged

func _ready() -> void:
	$atkArea/attack.hide()
	
	
	
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
	attack()
	enemyAttack()
	
	pawnDmgCheck()

	if damageE:
		print("damasdad")
	if Input.is_action_just_pressed("pause"):
		pause()
	
	if health <=0:
		playerAlive = false
		health = 0
		print("golly im dead")
		self.queue_free()
	
	
func player():
	pass
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

func attack():
	if Input.is_action_just_pressed("attack") && attackCooldown == true:
		$atkArea/attack/AnimationPlayer.play("explosion")
		damageE = true
		attackCooldown = false
		$AtckCoolDown.start()
	else:
		damageE = false
		


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$atkArea/attack.hide()


func _on_animation_player_animation_started(anim_named: StringName) -> void:
	$atkArea/attack.show()
	
func attackPos():
	atk.position = Vector2(-85,0)
	
func attackPosR():
	atk.position = Vector2(0,0)
	
func attackPosT():
	atk.position = Vector2(-42,-42)
	
func attackPosB():
	atk.position = Vector2(-42,42)
	
func attackPostTR():
	atk.position = Vector2(-10,-36)
	
func attackPostTL():
	atk.position = Vector2(-85,-36)
	
func attackPostBR():
	atk.position = Vector2(-10,36)
	
func attackPostBL():
	atk.position = Vector2(-80,36)


func _on_atk_area_body_entered(body: Node2D) -> void:
	if body.has_method("pawnB"):
		pawnInArea = true
	if body.has_method("takeDamage"):
		enemy = body 
		print("Enemy detected: ", enemy)


func _on_atk_area_body_exited(body: Node2D) -> void:
	if body.has_method("pawnB"):
		pawnInArea = false
		
func pause():
	if paused:
		pauseMenu.hide()
		Engine.time_scale = 1
	else:
		pauseMenu.show()
		Engine.time_scale = 0
		
	paused = !paused


func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.has_method("pawnB"):
		enemyInArea = true
		


func _on_hit_box_body_exited(body: Node2D) -> void:
	if body.has_method("pawnB"):
		enemyInArea = false
		
func enemyAttack():
	if enemyInArea && enemyAttackCooldown == true:
		health = health - 20
		enemyAttackCooldown = false
		healthChanged.emit()
		$hitCooldown.start()
		print(health)


func _on_hit_cooldown_timeout() -> void:
	enemyAttackCooldown = true


func _on_atck_cool_down_timeout() -> void:
	attackCooldown = true
	
func pawnDmgCheck():
	if pawnInArea == true && damageE == true:
		if enemy != null:
			enemy.takeDamage()
		else:
			print("Enemy object is null!")

func _playerarea():
	add_to_group("player")

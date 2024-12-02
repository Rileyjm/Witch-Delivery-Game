extends CharacterBody2D


var speed = 120
var playerChase = false
var player = null
var pawn = null
var distance_to_enemy: float = 0.0
@export var play: Node2D = null


func _physics_process(delta: float) -> void:
	if playerChase && distance_to_enemy>70:
		position += (player.position - position).normalized() * speed * delta
		move_and_collide(Vector2(0,0))
		var direction = (player.position - position).normalized() 
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	is_walking()
	spriteFlip()
	isAttacking()
	
	if play:
		distance_to_enemy = global_position.distance_to(play.global_position)
		#print("Distance to enemy: ", distance_to_enemy)
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	player = body
	playerChase =true
	

func _on_area_2d_body_exited(body: Node2D) -> void:
	player = null
	playerChase = false

func is_walking():
	if velocity.length() > 0:
		$Sprite2D/AnimationTree.set("parameters/conditions/walk",true)
		$Sprite2D/AnimationTree.set("parameters/conditions/notWalk",false)
		#print("walking")
	else:
		$Sprite2D/AnimationTree.set("parameters/conditions/notWalk",true)
		$Sprite2D/AnimationTree.set("parameters/conditions/walk",false)
		#print("not  walking")

func spriteFlip():
	if velocity.x >0:
		$Sprite2D.flip_h = false
	if velocity.x < 0:
		$Sprite2D.flip_h = true
	else:
			pass
func isAttacking():
	if distance_to_enemy < 75:
		$Sprite2D/AnimationTree.set("parameters/conditions/isAttacking",true)
		$Sprite2D/AnimationTree.set("parameters/conditions/isNotAttacking",false)
	else:
		$Sprite2D/AnimationTree.set("parameters/conditions/isNotAttacking",true)
		$Sprite2D/AnimationTree.set("parameters/conditions/isAttacking",false)
		
func pawnB():
	pass

extends RigidBody2D

# This will be the Area2D to detect the player
@export var area: Area2D

func _ready():
	if area:
		area.connect("body_entered", _on_body_entered)
		print("Signal connected")
	else:
		print("Area2D is not assigned!")

func _on_body_entered(body):
	print("Body entered: ", body)
	if body.is_in_group("player"):  # Ensure your player is in a group called "player"
		print("Player detected!")
		queue_free()  # This will remove the Rigidbody2D from the scene

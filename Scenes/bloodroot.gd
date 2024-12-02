extends Sprite2D
var playerInArea = false


func _process(delta: float) -> void:
	if playerInArea:
		if Input.is_action_just_pressed("talk"):
			run_dialogue("bloodroot")
			Global.bloodroot= true


func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)


func _on_bloodroot_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		playerInArea = true


func _on_bloodroot_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		playerInArea = false

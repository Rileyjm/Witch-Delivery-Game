extends Sprite2D

var playerInArea = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerInArea :
		if Input.is_action_just_pressed("talk") && Global.vampDia == 1:
			run_dialogue("Vampire")
			Global.vampDia=2
		if Input.is_action_just_pressed("talk") && Global.vampDia == 2:
			run_dialogue("VampD")
func _on_chat_detection_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		playerInArea = true


func _on_chat_detection_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		playerInArea = false
func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
	

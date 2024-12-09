extends Sprite2D
var playerInArea = false


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerInArea :
		if Input.is_action_just_pressed("talk") && Global.gDia == 1:
			run_dialogue("Goblin")
			Global.gDia=2
		if Input.is_action_just_pressed("talk") && Global.gDia == 2:
			run_dialogue("GoblinD")
		if Input.is_action_just_pressed("talk") && Global.gDia == 3:
			run_dialogue("GoblinP")
			Global.score = Global.score +20
	Global.gDiaCheck()

func _on_chat_det_gob_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		playerInArea = true


func _on_chat_det_gob_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		playerInArea = false
func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
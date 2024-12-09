extends Sprite2D

var playerInArea = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerInArea :
		if Input.is_action_just_pressed("talk") && Global.fairyDia == 1:
			run_dialogue("fairy")
			Global.fairyDia=2
		if Input.is_action_just_pressed("talk") && Global.fairyDia == 2:
			run_dialogue("fairyD")
		if Input.is_action_just_pressed("talk") && Global.fairyDia == 3:
			run_dialogue("fairyP")
			Global.score = Global.score +20

	Global.fDiaCheck()
func _on_f_chat_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		playerInArea = true


func _on_f_chat_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		playerInArea = false
func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
	

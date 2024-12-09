extends Sprite2D

var playerInArea = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerInArea :
		if Input.is_action_just_pressed("talk") && Global.mDia == 1:
			run_dialogue("m")
			Global.mDia=2
		if Input.is_action_just_pressed("talk") && Global.mDia == 2:
			run_dialogue("mD")
		if Input.is_action_just_pressed("talk") && Global.mDia == 3:
			run_dialogue("mP")
			Global.score = Global.score +20
	Global.mDiaCheck()

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
	

func _on_m_talk_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		playerInArea = true


func _on_m_talk_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		playerInArea = false

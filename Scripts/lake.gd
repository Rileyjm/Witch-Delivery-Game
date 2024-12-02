extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_scene()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true

func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "lake":
			get_tree().change_scene_to_file("res://Scenes/MainArea.tscn")
			Global.finish_changescenes()
			Global.current_scene = "world"

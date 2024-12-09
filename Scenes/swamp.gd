extends Node2D


func _process(delta: float) -> void:
	change_scene()

	
func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "swamp":
			get_tree().change_scene_to_file("res://Scenes/MainArea.tscn")
			Global.finish_changescenes()
			Global.current_scene = "world"


func _on_exit_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true

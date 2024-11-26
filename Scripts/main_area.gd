extends Node2D

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	change_scene()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true

func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "world":
			get_tree().change_scene_to_file("res://Scenes/Mountains.tscn")
			Global.finish_changescenes()


func _on_forest_path_body_entered(body: Node2D) -> void:
	if Global.transition_scene == true:
		if Global.current_scene == "world":
			get_tree().change_scene_to_file("res://Scenes/Forest.tscn")
			Global.finish_changescenes()

extends Node2D

func _process(delta: float) -> void:
	change_scene()
# Called when the node enters the scene tree for the first time.



func _on_entrance_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
	
func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "mountains":
			get_tree().change_scene_to_file("res://Scenes/MainArea.tscn")
			Global.finish_changescenes()
			Global.current_scene = "world"

		

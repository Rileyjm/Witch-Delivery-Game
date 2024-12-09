extends Node2D

var forPath = false
var forLake = false
var forSwamp = false
@export var mountPath = false
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	change_scene()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		mountPath = true

func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "world":
			if forPath ==true:
				get_tree().change_scene_to_file("res://Scenes/Forest.tscn")
				Global.finish_changescenes()
				Global.current_scene = "forest"
			if mountPath == true:
				get_tree().change_scene_to_file("res://Scenes/Mountains.tscn")
				Global.finish_changescenes()
				Global.current_scene = "mountains"
			if forLake == true:
				get_tree().change_scene_to_file("res://Scenes/Lake.tscn")
				Global.finish_changescenes()
				Global.current_scene = "lake"
			if forSwamp == true:
				get_tree().change_scene_to_file("res://Scenes/Swamp.tscn")
				Global.finish_changescenes()
				Global.current_scene = "swamp"


func _on_forest_path_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		forPath = true


func _on_lake_path_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		forLake = true


func _on_swamp_path_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		Global.transition_scene = true
		forSwamp = true

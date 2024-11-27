extends Node

var current_scene = "world"
var transition_scene = false
var vampDia = 1

func finish_changescenes():
	if transition_scene == true:
		transition_scene =false
		if current_scene == "world":
			current_scene = "mountains"
		else:
			current_scene = "world"

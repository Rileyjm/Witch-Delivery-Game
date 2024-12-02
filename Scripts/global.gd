extends Node

var current_scene = "world"
var transition_scene = false
var vampDia = 1
var fairyDia = 1
var mDia = 1
var daisy = false
var bloodroot = false
var bloodLily = false
var cloudberries = false



func finish_changescenes():
	if transition_scene == true:
		transition_scene =false

func diaCheck():
	if bloodLily == true && bloodroot == true && daisy == true:
		vampDia = 3

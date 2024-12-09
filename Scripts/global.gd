extends Node

var playerAttack = false
var current_scene = "world"
var transition_scene = false
var vampDia = 1
var fairyDia = 1
var mDia = 1
var gDia = 1
var daisy = false
var bloodroot = false
var bloodLily = false
var cloudberries = false
var snowDrop = false
var light = false
var feather = false
var bubble = false
var brain = false
var grass = false
var rootbulb = false
var chaos = false
var crimson = false
var score = 0

func finish_changescenes():
	if transition_scene == true:
		transition_scene =false

func diaCheck():
	if bloodLily == true && bloodroot == true && crimson == true:
		vampDia = 3
		
func mDiaCheck():
	if cloudberries == true && feather == true && bubble == true:
		mDia = 3
func gDiaCheck():
	if brain == true && grass == true && rootbulb == true:
		gDia = 3
		
func fDiaCheck():
	if daisy == true && light == true && snowDrop == true:
		fairyDia = 3

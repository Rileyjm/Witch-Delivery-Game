extends Control

@onready var startButton = $MarginContainer/VBoxContainer/Start/Label
@onready var quitButton = $MarginContainer/VBoxContainer/Quit/Label2


func _physics_process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	change_scene()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_start_button_down() -> void:
	startButton.vertical_alignment = .5


func _on_quit_button_down() -> void:
	quitButton.vertical_alignment = .5

func change_scene():
	get_tree().change_scene_to_file("res://Scenes/MainArea.tscn")
	Global.finish_changescenes()
	Global.current_scene = "world"

extends Control

@onready var player = $".."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame...
func _process(delta: float) -> void:
	pass


func _on_resume_pressed() -> void:
		player.pause()


func _on_quit_pressed() -> void:
	get_tree().quit()
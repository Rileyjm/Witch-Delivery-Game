extends Camera2D

# Dictionary mapping scene names to zoom levels
var scene_zoom_levels = {
	"world": Vector2(1.2, 1),
	"mountains": Vector2(2, 2),
	"res://scenes/Scene3.tscn": Vector2(2, 2)
}

func _ready() -> void:
	# Get the current scene's path
	var scene = Global.current_scene
	# Check if the scene has a predefined zoom level
	if scene in scene_zoom_levels:
		# Set the camera zoom to the scene-specific zoom level
		zoom = scene_zoom_levels[scene]
	else:
		# Default zoom level
		zoom = Vector2(1.2, 1.2)

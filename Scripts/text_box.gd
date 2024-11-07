extends CanvasLayer

const tRate = 0.9
@onready var textbox_container = $TextboxContainer
@onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/end
@onready var text = $TextboxContainer/MarginContainer/HBoxContainer/text

func _ready():
	add_text("text being adde
	
	ah")

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	text.text = ""
	textbox_container.hide()

func show_textbox():
	start_symbol.text = "*"
	textbox_container.show()

func add_text(next_text):
	text.text = next_text
	text.visible_characters = 0 
	show_textbox()
	
	var tween = get_tree().create_tween()
	tween.tween_property(text, "visible_characters", text.text.length(), tRate)

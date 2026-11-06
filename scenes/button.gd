extends Button

@export var Name: String = "Diode"
@export var Value: String = "50 kOhm"
#@expor var Shortcut: String = ""

func _ready() -> void:
	get_node("Name").text = Name
	get_node("Value").text = Value
	if shortcut.has_valid_event():
		get_node("Shortcut").text = shortcut.get_as_text()[0]

extends Button

@export var Name: String = "Diode"
@export var Value: String = "SRSh"
#@expor var Shortcut: String = ""

var textures: Dictionary = {"Element": Rect2(0,0,0,0),
														"Diode": Rect2(7,7,600,200),
														"Capasitor": Rect2(7,257,600,200),
														"Coil": Rect2(7,501,600,113),
														"Resitor": Rect2(7,651,600,110)}


func _ready() -> void:
	get_node("Name").text = Name
	get_node("Value").text = Value
	get_node("Element").region_rect = textures[Name]
	
	if shortcut == null:
		pass
	elif shortcut.has_valid_event():
		get_node("Shortcut").text = shortcut.get_as_text()[0]

extends Node

@export var textures: Dictionary = {"Element": Rect2(0,0,0,0),
																		"Diode": Rect2(7,7,600,200),
																		"Capasitor": Rect2(7,257,600,200),
																		"Coil": Rect2(7,501,600,113),
																		"Resitor": Rect2(7,651,600,110)}

# Нужно будет для создания большого аталаса текстур
# Изучить .sid формат
# const SAVE_PATH = "res://GlobalData.sid"

# var config = ConfigFile.new()

# func _ready() -> void:
# config.set_value("")

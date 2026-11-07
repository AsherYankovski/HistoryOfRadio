extends Node2D

@export var element_name: String = "Element"

var textures: Dictionary = {"Element": Rect2(0,0,0,0),
														"Diode": Rect2(7,7,600,200),
														"Capasitor": Rect2(7,257,600,200),
														"Coil": Rect2(7,501,600,113),
														"Resitor": Rect2(7,651,600,110)}

func _ready() -> void:
	get_node("Sprite2D").region_rect = textures[element_name]

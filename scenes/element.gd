extends Node2D

var textures: Dictionary = {"Element": Rect2(0,0,0,0),"Diode": Rect2(7,7,600,200), "Capasitor": Rect2(7,257,600,200), "Coil": Rect2(7,457,600,200)}

func _process(_delta: float) -> void:
	get_node("Sprite2D").region_rect = textures[name]

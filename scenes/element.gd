extends Node2D
signal clicked(node_name: String)

@export var element_name: String = "Element"

func _ready() -> void:
	get_node("Sprite2D").region_rect = Storage.textures[element_name]


func _on_area_2d_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if Input.is_action_pressed("LClick"):
		emit_signal("clicked",name)

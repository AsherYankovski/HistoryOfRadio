extends Control

var hold_element: bool = 0
@export var grid_step: int = 16
@onready var DB: ResourcePreloader = get_node("Preloader")


func _on_button_pressed(n: String = get_node("Button").Name) -> void:
	print(n)
	if not hold_element:
		var element: Resource = DB.get_resource(n)
		add_child(element.instantiate())
		get_node("Element").name = "Coil"
		hold_element = not hold_element
	else:
		remove_child(get_node("Coil"))
		hold_element = not hold_element


func _process(_delta: float) -> void:
	if hold_element:
		get_node("Coil").position = round(get_global_mouse_position()/grid_step)*grid_step
		if Input.is_action_just_pressed("LMB"):
			hold_element = 0
			pass

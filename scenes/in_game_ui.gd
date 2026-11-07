extends Control

var hold_element: bool = 0
var n: int = 0
var holded_element: String = ""
@export var grid_step: int = 16
@onready var DB: ResourcePreloader = get_node("Preloader")


func _process(_delta: float) -> void:
	if hold_element:
		get_node(holded_element).position = round(get_global_mouse_position()/grid_step)*grid_step
		if Input.is_action_just_pressed("LMB"):
			hold_element = 0
			get_node("Button").button_pressed = 0
			pass


func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		n += 1
		# n = n + 1
		var element: Resource = DB.get_resource("element")

		var elem: Node2D = element.instantiate()
		elem.name = get_node("Button/Name").text + str(n)
		holded_element = get_node("Button/Name").text + str(n)
		elem.element_name = get_node("Button/Name").text

		add_child(elem)

		hold_element = 1
	elif hold_element:
		remove_child(get_node(holded_element))
		n = n - 1
		hold_element = 0

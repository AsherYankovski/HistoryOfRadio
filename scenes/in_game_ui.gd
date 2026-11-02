extends Control

var f1: bool = 0
var f2: bool = 0
var b: String = "Diode"
@export var grid_step: int = 16
@onready var DB: ResourcePreloader = get_node("Preloader")


func _on_button_button_down() -> void:
	if not f2:
		var element: Resource = DB.get_resource(b)
		add_child(element.instantiate())
		f1 = not f1
	else:
		remove_child(get_node(b))

func _ready() -> void:
#	elements = {"Diode" : get_node("Buttons/Diode")}
	DB.get_resource(b)
	pass

func _process(_delta: float) -> void:
	if f1:
		get_node(b).position = round(get_global_mouse_position()/grid_step)*grid_step

extends Control

var hold_element: bool = 0 # Переменная, показывающая подобран компонент или нет
var holded_element: Node2D # Подобраный элемент
var n: int = 0 # Заменить на вменяемое имя для числа компонентов
@export var grid_step: int = 16 # Шаг сетки в пикселях
@onready var DB: ResourcePreloader = get_node("Preloader") # Подгрузка внешнего хранилища ресурсов в переменную


func _process(_delta: float) -> void:
	if hold_element:
		# Изменение позиции подобранного элемента на позицию курсора мыши с учётом шага сетки
		holded_element.position = round(get_global_mouse_position()/grid_step)*grid_step
		if Input.is_action_just_pressed("LClick"):
			holded_element.clicked.connect(_on_element_clicked)
			if holded_element.clicked.is_connected(_on_element_clicked):
				print("Successfuly connected")
			hold_element = 0
			get_node("Button").button_pressed = 0


# Функция обработки нажатия на кнопку
func _on_button_toggled(toggled_on: bool) -> void:
	# Если кнопка была нажата
	if toggled_on:
		# Создание компонента и добавление его в дерево
		var element_resource: Resource = DB.get_resource("element")
		var element_name: String = get_node("Button/Name").text
		var element: Node2D = create_element(element_resource,element_name,str(n))
		add_child(element)
		# Увеличение числа компонентов
		n += 1
		hold_element = 1
	# Если кнопка была отжата
	elif hold_element:
		# Убрать непоставленный элемент
		remove_child(holded_element)
		# Уменьшение числа компонентов
		n -= 1
		hold_element = 0

# Функция создания элемента
# Заменить sn на вменяемое имя для номера элемента
func create_element(e_resource: Resource, e_name: String, sn: String) -> Node2D:
	var element: Node2D = e_resource.instantiate()
	element.name = e_name + sn
	holded_element = element
	element.element_name = e_name
	return element


func _on_element_clicked() -> void:
	print("Element clicked")

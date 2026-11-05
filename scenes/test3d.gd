extends CharacterBody3D
@export var g: float = 9.8
@export var speed: float = 0.5
@export var is_draging: bool = 0
@onready var RayCast = $/root/root/Camera3D/RayCast3D
@onready var test = $/root/root/test

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print()


func _physics_process(delta: float) -> void:
	var hit = RayCast.get_collider()
	print(hit, test)
	if Input.is_action_pressed("ЛКМ") and hit == test:
		is_draging = 1
	if Input.is_action_pressed("ЛКМ") and is_draging:
		velocity.x = Input.get_last_mouse_velocity()[0]*speed*delta
		velocity.y = -Input.get_last_mouse_velocity()[1]*speed*delta
	else:
		is_draging = 0 
	if not is_on_floor() and not is_draging:
		velocity.y -= g*delta
	move_and_slide()

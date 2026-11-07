extends CharacterBody3D

@export var g: float = 9.8
@export var speed: float = 0.4
@export var is_draging: bool = 0
@export var mode: bool = 0
@onready var RayCast = $/root/root/Camera3D/RayCast3D
@onready var test = self

func _ready() -> void:
	print()


func _physics_process(delta: float) -> void:
	var hit = RayCast.get_collider()
	#print(RayCast.target_position, hit, test)
	var is_LKM: bool = Input.is_action_pressed("ЛКМ")
	if is_LKM and hit == test:
		is_draging = 1
	if is_LKM and is_draging:
		velocity.x = Input.get_last_mouse_velocity().x*speed*delta
		velocity.y = -Input.get_last_mouse_velocity().y*speed*delta
	else:
		if mode:
			velocity.x = Input.get_last_mouse_velocity().x*speed*delta
			velocity.y = -Input.get_last_mouse_velocity().y*speed*delta
		else:
			is_draging = 0
	if Input.is_action_pressed("ThorowBlock") and mode:
		is_draging = 0
		mode = 0
	if not is_on_floor() and not is_draging:
		velocity.y -= g*delta
	if Input.is_action_pressed("RotationYСlockwise") and is_draging:
		rotation.y += 90
	if Input.is_action_pressed("RotationYCounterclockwise") and is_draging:
		rotation.y -= 90
	if Input.is_action_pressed("RotationXСlockwise") and is_draging:
		rotation.x += 90
	if Input.is_action_pressed("RotationXCounterclockwise") and is_draging:
		rotation.x -= 90
	move_and_slide()

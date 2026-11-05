extends Camera3D

@onready var RayCast = $RayCast3D
@export var mouse_sensitivity: float = 0.002
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		rotate_x(-event.relative.y * mouse_sensitivity)
		rotation.z=0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var hit = RayCast.get_collider()
	#var mouse_pos = get_viewport().get_mouse_position()
	#print(hit)
	if Input.is_action_pressed("ЛКМ"):
		print("ЛКМ нажата (клик)!")
	

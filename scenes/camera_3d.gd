extends Camera3D

@onready var RayCast = $RayCast3D
@onready var Camera = $/root/root/Camera3D
@onready var MenuUI = $/root/root/menu_ui
@onready var DB: ResourcePreloader = $/root/root/ResourcePreloader
@onready var root = $/root/root
@export var mouse_sensitivity: float = 0.0002
@export var max_dist_raycast: float = 25
var block: Node



func _paste_block(b: String) -> void:
	var element: Resource = DB.get_resource(b)
	block = element.instantiate()
	block.scale = Vector3(0.25, 0.25, 0.25)
	var my_plane = Plane(Vector3.FORWARD, 0.52)
	var intersection = my_plane.intersects_ray(Camera.position, RayCast.target_position)
	block.position = Vector3(intersection)
	block.mode = 1
	root.add_child(block)
	print(block)

func _delete_block(b: String) -> void:
	block.queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(MenuUI)
	MenuUI.paste_block.connect(_paste_block)
	MenuUI.delete_block.connect(_delete_block)

	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		#rotate_y(-event.relative.x * mouse_sensitivity)
		#rotate_x(-event.relative.y * mouse_sensitivity)
		rotation.z=0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_direction = Camera.project_ray_normal(mouse_pos)
	RayCast.target_position = ray_direction*max_dist_raycast
	var hit = RayCast.get_collider()
	#print(RayCast.target_position, hit)
	if Input.is_action_pressed("ЛКМ"):
		print("ЛКМ")
	if Input.is_action_pressed("ESC"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

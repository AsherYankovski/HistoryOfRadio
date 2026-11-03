extends Node2D

var textures: Dictionary = {1: "Diode", 2: "Capasitor", 3: "Coil"}
var cnt: int = 0

func test(b: String) -> void:
	if b.match("Diode"):
		get_node("Sprite2D").region_rect = Rect2(7,7,600,200)
	elif b.match("Capasitor"):
		get_node("Sprite2D").region_rect = Rect2(7,257,600,200)
	elif b.match("Coil"):
		get_node("Sprite2D").region_rect = Rect2(7,457,600,200)
	pass


func _on_timer_timeout() -> void:
	cnt += 1
	test(textures[cnt])
	cnt = cnt % 3
pass # Replace with function body.

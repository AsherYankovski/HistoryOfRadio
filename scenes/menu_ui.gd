extends CanvasLayer

var f1: bool = 0
var f2: bool = 0
signal paste_block(b: String)
signal delete_block(b: String)
func _ready() -> void:
	pass


func _on_block_button_down(b) -> void:
	#print(b)
	if not f1:
		paste_block.emit(b)
		f1 = not f1
	else:
		delete_block.emit(b)
		f1 = not f1 

extends Label

var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer == 0:
		text = ""


func _on_objects_event() -> void:
	pass # Replace with function body.

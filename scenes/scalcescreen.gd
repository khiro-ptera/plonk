extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".custom_minimum_size = get_viewport().size
	$VBoxContainer2/HBoxContainer/ObjBox.custom_minimum_size.x = get_viewport().size.x * 800 / 1152
	$VBoxContainer2/HBoxContainer/VBoxContainer.custom_minimum_size.x = get_viewport().size.x * 300 / 1152

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$".".custom_minimum_size = get_viewport().size
	$VBoxContainer2/HBoxContainer/ObjBox.custom_minimum_size.x = get_viewport().size.x * 800 / 1152
	$VBoxContainer2/HBoxContainer/VBoxContainer.custom_minimum_size.x = get_viewport().size.x * 300 / 1152

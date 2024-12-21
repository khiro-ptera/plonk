extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".custom_minimum_size = get_viewport().size
	$VBoxContainer2/HBoxContainer/ObjBox.custom_minimum_size.x = get_viewport().size.x * 800 / 1152
	$VBoxContainer2/HBoxContainer/ShopBox.custom_minimum_size.x = get_viewport().size.x * 120 / 1152
	$VBoxContainer2/HBoxContainer/BoonBox.custom_minimum_size.x = get_viewport().size.x * 120 / 1152

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$".".custom_minimum_size = get_viewport().size
	$VBoxContainer2/HBoxContainer/ObjBox.custom_minimum_size.x = get_viewport().size.x * 800 / 1152
	$VBoxContainer2/HBoxContainer/ShopBox.custom_minimum_size.x = get_viewport().size.x * 120 / 1152
	$VBoxContainer2/HBoxContainer/BoonBox.custom_minimum_size.x = get_viewport().size.x * 120 / 1152
	
	$VBoxContainer2/HBoxContainer/BoonBox/Label.size.x = $VBoxContainer2/HBoxContainer/BoonBox.size.x
	if Global.prestige == 0:
		$VBoxContainer2/HBoxContainer/BoonBox/Label.text = "???"
		$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.visible = false
		$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.disabled = true
	else:
		$VBoxContainer2/HBoxContainer/BoonBox/Label.text = "Boons"
		$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.visible = true
		if Global.boons == 0:
			$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.disabled = true
		else:
			$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.disabled = false

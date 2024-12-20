extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	disabled = true
	$Label.text = "???"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.size = size
	if Global.plonks > 9999:
		disabled = false
		$Label.text = "Prestige " + str(Global.prestige)
	elif Global.prestige > 0:
		disabled = true
		$Label.text = "Boons " + str(Global.boons)
	else:
		disabled = true
		$Label.text = "???"

extends MarginContainer

var ballCounts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().visible = false
	$".".custom_minimum_size = get_viewport().size
	$HBoxContainer/Menu/Header.text = "Stats: "
	updateCounts()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$".".custom_minimum_size = get_viewport().size
	$HBoxContainer/Menu/TotalC.text = "Total Collisions " + str(Global.totalCollisions)
	$HBoxContainer/Menu/TotalLV.text = "Total Linear Velocity " + str(Global.totalLV)
	$HBoxContainer/Menu/TotalAV.text = "Total Angular Velocity " + str(Global.totalAV)
	$HBoxContainer/Menu/CritChance.text = "Crit Chance " + str(Global.critRate)
	$HBoxContainer/Menu/CritMult.text = "Crit Multiplier " + str(Global.critMult)
	$HBoxContainer/Menu/SizeMult.text = "Size Multiplier " + str(Global.plonkiScale)
	$HBoxContainer/Menu/Spin.text = "Spin " + str(Global.spin)
	$HBoxContainer/Menu/Prestiges.text = "Times Prestiged " + str(Global.prestige)

func _on_objects_add_ball(b: int) -> void:
	ballCounts[b] += 1
	updateCounts()

func updateCounts() -> void:
	$HBoxContainer/Menu/Ball0.text = "Basic Plonki " + str(ballCounts[0])
	$HBoxContainer/Menu/Ball1.text = "Big Plonki " + str(ballCounts[1])
	$HBoxContainer/Menu/Ball2.text = "Stonki " + str(ballCounts[2])
	$HBoxContainer/Menu/Ball3.text = "Gronki " + str(ballCounts[3])
	$HBoxContainer/Menu/Ball5.text = "Comets " + str(ballCounts[5])
	$HBoxContainer/Menu/Ball6.text = "Slothi " + str(ballCounts[6])
	$HBoxContainer/Menu/Ball7.text = "Quanti " + str(ballCounts[7])
	$HBoxContainer/Menu/Ball8.text = "Scriballs " + str(ballCounts[8])
	$HBoxContainer/Menu/Ball9.text = "Spooki " + str(ballCounts[9])

func _on_texture_button_pressed() -> void:
	get_parent().visible = false

func _on_stats_button_pressed() -> void:
	get_parent().visible = true
	

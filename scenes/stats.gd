extends MarginContainer

var ballCounts = [0, 0, 0, 0, 0]

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

func _on_objects_add_ball(b: int) -> void:
	ballCounts[b] += 1
	updateCounts()

func updateCounts() -> void:
	$HBoxContainer/Menu/Ball0.text = "Basic Balls " + str(ballCounts[0])
	$HBoxContainer/Menu/Ball1.text = "Big Balls " + str(ballCounts[1])
	$HBoxContainer/Menu/Ball2.text = "Stars " + str(ballCounts[2])
	$HBoxContainer/Menu/Ball3.text = "Grav Balls " + str(ballCounts[3])

func _on_texture_button_pressed() -> void:
	get_parent().visible = false

func _on_stats_button_pressed() -> void:
	get_parent().visible = true
	

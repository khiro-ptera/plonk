extends Label

var timer = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../../HBoxContainer/ObjBox/Objects".event.connect(_on_objects_event)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.event != 0 && timer <= 0.0: # bug1 workaround
		timer = Global.eventTime
	
	if timer <= 0.0:
		text = "A Normal Day in Plonkworld"
	else:
		if Global.event == 1: # bug1 workaround
			text = "Block Invasion!!"
		elif Global.event == 2:
			text = "Double Plonks!!"
		timer -= delta
		if timer <= 0.0:
			Global.event = 0
		# print(timer)


func _on_objects_event(event) -> void: # not working for some reason? (bug1)
	print("gg")
	if event == 1:
		timer = 15.0
		print("hh")
		text = "Block Invasion!!"
	elif event == 2:
		timer = 15.0
		print("hh1")
		text = "Double Plonks!!"

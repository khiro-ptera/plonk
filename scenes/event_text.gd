extends Label

var timer = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# $"../../HBoxContainer/ObjBox/Objects".event.connect(_on_objects_event)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if timer <= 0.0:
		text = "A Normal Day in Plonkworld"
	else:
		timer -= delta
		# print(timer)


func _on_objects_event(event) -> void: 
	print("gg")
	if event == 1:
		timer = Global.eventTime
		print("hh")
		text = "Block Invasion!!"
	elif event == 2:
		timer = Global.eventTime
		print("hh1")
		text = "Double Plonks!!"

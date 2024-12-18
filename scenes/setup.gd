extends Node2D

var ball = preload("res://scenes/ball.tscn")
var block = preload("res://scenes/block.tscn")
signal event

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	genBox(32, 24, Vector2(50, 50))
	spawnBall()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func genBox(w, h, startpos = Vector2(0, 0)) -> void:
	for i in h:
		var instance = block.instantiate()
		add_child(instance)
		instance.position.y = i * 100 * instance.scaler # 100 is sprite size
		
		var instance2 = block.instantiate()
		add_child(instance2)
		instance2.position.x = w * 100 * instance2.scaler
		instance2.position.y = i * 100 * instance2.scaler
		
		instance.position += startpos
		instance2.position += startpos
		
	for i in w:
		var instance = block.instantiate()
		add_child(instance)
		instance.position.x = i * 100 * instance.scaler
		var instance2 = block.instantiate()
		add_child(instance2)
		instance2.position.y = h * 100 * instance2.scaler
		instance2.position.x = i * 100 * instance2.scaler
		
		instance.position += startpos
		instance2.position += startpos
		
	var instance = block.instantiate()
	add_child(instance)
	instance.position.y = h * 100 * instance.scaler
	instance.position.x = w * 100 * instance.scaler
	instance.position += startpos

func spawnBall(type = 0, pos = Vector2(randi_range(100, 200), randi_range(100, 200)), 
vel = Vector2(100, 100).rotated(randf_range(-3.14, 3.14))) -> void: # type, position, velocity
	var instance = ball.instantiate()
	add_child(instance)
	instance.type = type
	instance.position = pos
	instance.linear_velocity = vel
	if type == 1:
		instance.scaler = 0.5
	elif type == 2:
		instance.scaler = 0.4

func addBlock(pos) -> void:
	var instance = block.instantiate()
	add_child(instance)
	instance.position = pos

func _on_add_ball_pressed() -> void:
	if Global.plonks >= Global.ballCost:
		Global.plonks -= Global.ballCost
		Global.ballCost *= 3
		spawnBall()

func _on_add_ball_2_pressed() -> void:
	if Global.plonks >= Global.bigBallCost:
		Global.plonks -= Global.bigBallCost
		Global.bigBallCost *= 10
		spawnBall(1)


func _on_add_ball_3_pressed() -> void:
	if Global.plonks >= Global.starCost:
		Global.plonks -= Global.starCost
		Global.starCost *= 5
		spawnBall(2)

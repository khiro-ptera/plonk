extends Node2D

var ball = preload("res://scenes/ball.tscn")
var block = preload("res://scenes/block.tscn")
var eventcd = 60.0 # initialize for earlist first event, lower for testing purposes

const maxEventcd = 60.0

var eventChance = 50000 # 1000delta/eventChance is actual chance of event after max cd is over

signal event(e)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	genBox(32, 24, Vector2(50, 50))
	spawnBall()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if eventcd > 0.0:
		eventcd -= delta
	else:
		if randi_range(1, eventChance) < int(delta * 1000): # chance per frame for an event after cd
			var rtemp = randi_range(1, 2)
			if rtemp == 1:
				event.emit(1) 
				print("hi")
				for i in 10:
					var instance = block.instantiate()
					add_child(instance)
					instance.position = Vector2(randi_range(100, 640), randi_range(100, 480))
					instance.timed = Global.eventTime
				eventcd = maxEventcd
			elif rtemp == 2:
				event.emit(2) 
				plonkMult(2, Global.eventTime)
				eventcd = maxEventcd
			elif rtemp == 3:
				pass
			elif rtemp == 4:
				pass
			elif rtemp == 5:
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

func plonkMult(mult, time) -> void: 
	print("mult by " + str(mult))
	Global.plonkMult *= mult
	await get_tree().create_timer(time).timeout
	Global.plonkMult /= mult

func spawnBall(type = 0, pos = Vector2(randi_range(80, 660), randi_range(80, 500)), 
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
		instance.angular_velocity = 0.5
	elif type == 3:
		instance.linear_velocity = Vector2(0, 0)
		instance.position.y = 100

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

func _on_add_ball_4_pressed() -> void:
	if Global.plonks >= Global.gravCost:
		Global.plonks -= Global.gravCost
		Global.gravCost *= 7
		spawnBall(3)

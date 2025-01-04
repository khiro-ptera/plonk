extends Node2D

var ball = preload("res://scenes/ball.tscn")
var block = preload("res://scenes/block.tscn")
var plonky = preload("res://scenes/plonky.tscn")
var eventcd = 90.0 # initialize for earlist first event, lower for testing purposes

const maxEventcd = 60.0

var eventChance = 50000 # 1000delta/eventChance is actual chance of event after max cd is over

var reinforce = 0

signal event(e)
signal addBall(b)
signal prestige()
signal plonkyDia()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	genBox(32, 24, Vector2(50, 50))
	
	# Test Zone!
	# Global.boons = 10
	# Global.prestige = 2
	# Global.plonks = 20000
	# Global.spookUnlock = true
	# spawnBall(11)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.totalLV = 0
	Global.totalAV = 0
	for _i in self.get_children():
		if _i is RigidBody2D:
			Global.totalLV += abs(_i.linear_velocity.x) + abs(_i.linear_velocity.y)
			Global.totalAV += abs(_i.angular_velocity)
	
	if eventcd > 0.0:
		eventcd -= delta
	else:
		if randi_range(1, eventChance) < int(delta * 1000): # chance per frame for an event after cd
			var rtemp = randi_range(1, 3)
			if rtemp == 1:
				event.emit(1) 
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
				event.emit(3)
				meteorRain()
				eventcd = maxEventcd
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
	Global.plonkMult *= mult
	await get_tree().create_timer(time).timeout
	Global.plonkMult /= mult

func meteorRain() -> void:
	for i in randi_range(int(Global.eventTime * 2) - 10, int(Global.eventTime * 2)):
		spawnBall(4, Vector2(randi_range(120, 640), 125), Vector2(randi_range(-50, 50), randi_range(275, 325)))
		await get_tree().create_timer(0.5).timeout

func spawnBall(type = 0, pos = Vector2(randi_range(125, 650), randi_range(125, 450)), 
vel = Vector2(100, 100).rotated(randf_range(-3.14, 3.14))) -> void: # type, position, velocity
	var instance = ball.instantiate()
	add_child(instance)
	instance.add_to_group("ball")
	instance.type = type
	addBall.emit(type)
	instance.position = pos
	instance.linear_velocity = vel
	if type == 1:
		instance.scaler = Global.plonkiScale * 2.5
	elif type == 2:
		instance.scaler = Global.plonkiScale * 2.0
		instance.angular_velocity = 0.5
	elif type == 3:
		instance.linear_velocity = Vector2(0, 0)
		instance.position.y = 100
	elif type == 4:
		instance.timed = 5.0
		instance.scaler = Global.plonkiScale * 0.9
	elif type == 5:
		instance.scaler = Global.plonkiScale * 0.9
	elif type == 6:
		instance.scaler = Global.plonkiScale * 2.0
	elif type == 10:
		# instance.linear_damp = 0.05
		pass

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
		Global.bigBallCost *= 4
		spawnBall(1)

func _on_add_ball_3_pressed() -> void:
	if Global.plonks >= Global.starCost:
		Global.plonks -= Global.starCost
		Global.starCost *= 5
		spawnBall(2)

func _on_add_ball_4_pressed() -> void:
	if Global.plonks >= Global.gravCost:
		Global.plonks -= Global.gravCost
		Global.gravCost *= 6
		spawnBall(3)

func _on_add_ball_5_pressed() -> void:
	if Global.plonks >= Global.cometCost:
		Global.plonks -= Global.cometCost
		Global.cometCost *= 8
		spawnBall(5)

func _on_add_ball_6_pressed() -> void:
	if Global.plonks >= Global.slothCost:
		Global.plonks -= Global.slothCost
		Global.slothCost *= 11
		spawnBall(6)

func _on_add_ball_7_pressed() -> void:
	if Global.plonks >= Global.quantCost:
		Global.plonks -= Global.quantCost
		Global.quantCost *= randi_range(12, 15)
		spawnBall(7)

func _on_add_ball_8_pressed() -> void:
	if Global.plonks >= Global.scribCost:
		Global.plonks -= Global.scribCost
		Global.scribCost *= 15
		spawnBall(8)

func _on_add_ball_9_pressed() -> void:
	if Global.plonks >= Global.spookCost:
		Global.plonks -= Global.spookCost
		Global.spookCost *= 18
		spawnBall(9)

func _on_add_ball_10_pressed() -> void:
	if Global.plonks >= Global.chiroCost:
		Global.plonks -= Global.chiroCost
		Global.chiroCost *= 21
		spawnBall(10)

func _on_add_ball_11_pressed() -> void:
	if Global.plonks >= Global.wharbCost:
		Global.plonks -= Global.wharbCost
		Global.wharbCost *= 21
		spawnBall(11)

func _on_prestige_pressed() -> void:
	var boons = int(Global.plonks / 10000)
	Global.plonks = 0
	Global.prestige += 1
	Global.boons += boons
	
	var children = get_children()
	for child in children:
		child.free()
	
	genBox(32, 24, Vector2(50, 50))
	for i in reinforce:
		genBox(32 - (i * 2), 24 - (i * 2), Vector2(50, 50) + i * Vector2(20, 20))
	
	if Global.active.has("Plonky"):
		var instance = plonky.instantiate()
		instance.position = Vector2(200, 200)
		add_child(instance)
	
	Global.resetPrices()
	prestige.emit()

func _on_boon_deck_add_boon(b: Variant) -> void:
	match b:
		"Reinforce":
			reinforce += 1
			genBox(32 - (reinforce * 2), 24 - (reinforce * 2), Vector2(50, 50) + reinforce * Vector2(20, 20))
		"Multchance":
			Global.critRate += 0.12
		"Scaleballs":
			for i in get_child_count():
				get_child(i).scaler *= 1.1
			Global.plonkiScale *= 1.1
		"Spincellerate":
			Global.spin += 0.001
		"Plonky":
			var instance = plonky.instantiate()
			instance.position = Vector2(200, 200)
			add_child(instance)
			plonkyDia.emit()

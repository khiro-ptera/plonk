extends RigidBody2D

var wave = preload("res://scenes/wave.tscn")
var echo = preload("res://scenes/echo.tscn")

@onready var scaler = Global.plonkiScale
@onready var oscale = Vector2(1, 1)
@onready var type = 0
var hitframes = 0
var cd = INF
var timed = INF
var bonus = 0

signal free(t)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	oscale = scale
	scale = scale * scaler
	$AnimatedSprite2D.play("0_mid")
	$SW.hide()
	$SW/Area2D/CollisionShape2D.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	scale = oscale * scaler
	
	$CollisionShapeBall.scale = scale
	$CollisionPolygonStar.scale = scale
	
	if type == 2:
		$BallSprite.hide()
		$StarSprite.show()
		$CollisionPolygonStar.disabled = false
		$CollisionShapeBall.disabled = true
		if abs(angular_velocity) > 0.05:
			angular_velocity *= 1 + (0.01 / abs(angular_velocity))
		$AnimatedSprite2D.rotate(-1 * angular_velocity / 90)
	elif type == 8:
		$BallSprite.hide()
		$StarSprite.hide()
		$Scribball.show()
		$Scribball.play("default")
		$Scribball.rotate(0.3)
	else:
		$BallSprite.show()
		$StarSprite.hide()
		$Scribball.hide()
		$CollisionPolygonStar.disabled = true
		$CollisionShapeBall.disabled = false
		
		if type == 3:
			constant_force.y = 0.1
		elif type == 5:
			if randi_range(1, 20000) < int(delta * 1000):
				slowdown()
			if abs(linear_velocity.x) + abs(linear_velocity.y) < 10:
				linear_velocity = Vector2(250, 250).rotated(randf_range(-3.14, 3.14))
		elif type == 6:
			linear_damp = 0.2
			angular_damp = 0.1
			bonus = randi_range(10, 12)
		elif type == 7:
			angular_damp = 1.5
		elif type == 9:
			bonus = 1
		elif type == 10:
			bonus = 6
			angular_damp = 0.5
	
	if type == 10:
		$Echolocate.show()
		$Echolocate/EchoCollide.disabled = false
	else:
		$Echolocate.hide()
		$Echolocate/EchoCollide.disabled = true
	
	if timed != INF:
		timed -= delta
		if timed <= 0.0:
			free.emit(type)
			queue_free()
	if cd != INF:
		cd -= delta
		if cd <= 0.0:
			cd = INF
	
	# angular_velocity += Global.spin/10
	if abs(angular_velocity) > 0.05:
		angular_velocity *= 1 + (Global.spin / abs(angular_velocity))
		
	if hitframes == 0:
		if abs(linear_velocity.x) + abs(linear_velocity.y) > 250:
			$AnimatedSprite2D.play(str(type) + "_fast")
		elif abs(linear_velocity.x) + abs(linear_velocity.y) < 150:
			$AnimatedSprite2D.play(str(type) + "_slow")
		else:
			$AnimatedSprite2D.play(str(type) + "_mid")
	hitframes -= 1
	
func slowdown(minV = 20, setZero = true) -> void:
	while abs(linear_velocity.x) + abs(linear_velocity.y) > minV:
		linear_velocity *= 0.85
		await get_tree().create_timer(0.1).timeout
	if setZero:
		linear_velocity = Vector2(0, 0)
	

func _on_body_entered(body: Node) -> void:
	if type == 4:
		free.emit(type)
		queue_free()
		return
	if Global.active.has("Shockwave"): # yeah this shockwave thing is bugged
		shockwave()
		# for i in 4:
			# var iwave = wave.instantiate()
			# var irand = randf_range(0.00, 3.14)
			# iwave.rand = irand
			# iwave.position = Vector2(50 * scaler, 50 * scaler).rotated(irand)
			# call_deferred("add_child", iwave)
			# add_child(iwave)
	if randf_range(0.000, 1.000) <= Global.critRate:
		Global.plonks += (Global.plonkGain + bonus) * Global.plonkMult * Global.critMult
		$Bounce2.play()
	else:
		Global.plonks += (Global.plonkGain + bonus) * Global.plonkMult
		$Bounce1.play()
	if type == 7: # quantus warp
		Global.plonks += randi_range(-33, 66)
		if randi_range(1, 7) == 1:
			angular_velocity = randf_range(-5.0, 5.0)
			position = Vector2(randi_range(125, 650), randi_range(125, 450)) # please dont break the game...
			$Warp1.play()
	elif type == 8:
		scaler += randf_range(-0.3, 0.3)
		if scaler > 0.75:
			scaler = 0.70
		elif scaler < 0.1:
			scaler = 0.15
		Global.plonks += int(scaler * 100)
	elif type == 9 && timed == INF:
		if randi_range(1, 2) == 1:
			linear_velocity = linear_velocity / 1.01
			get_parent().call_deferred("spawnBall", 9, position, linear_velocity)
			# get_parent().spawnBall(9, position + Vector2(randf_range(-0.5, 0.5), randf_range(-0.5, 0.5)), linear_velocity)
			modulate.a = 0.5
			linear_damp += 0.3
			timed = randf_range(1.0, 3.0)
	Global.totalCollisions += 1
	hitframes = 15
	$AnimatedSprite2D.play(str(type) + "_hit")
	# print(bonus)

func shockwave() -> void:
	$SW.show()
	$SW/Area2D/CollisionShape2D.disabled = false
	$SW.play("default")
	$SW.scale = scale * 1.5
	await get_tree().create_timer(0.3).timeout
	$SW.hide()
	$SW/Area2D/CollisionShape2D.disabled = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	linear_velocity += Vector2(randi_range(-15, 15), randi_range(-15, 15))
	angular_velocity += randf_range(-0.5, 0.5)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	linear_velocity = Vector2(0, 0)
	position = Vector2(randi_range(125, 650), randi_range(125, 450))


func _on_echolocate_body_entered(body: Node2D) -> void:
	if body != $"." && body.is_in_group("ball") && cd == INF:
		cd = 5.0
		var tempV = linear_velocity
		linear_velocity *= 0.8
		linear_damp += 0.3
		hitframes = 12
		$AnimatedSprite2D.play(str(type) + "_hit")
		for i in randi_range(5, 10):
			var echoi = echo.instantiate()
			call_deferred("add_child", echoi)
		await get_tree().create_timer(0.2).timeout
		linear_velocity = tempV * 1.11
		linear_damp -= 0.3
		if linear_damp < 0.01:
			linear_damp = 0.0
		var target = global_position.direction_to(body.position)
		linear_velocity = target * linear_velocity.length()

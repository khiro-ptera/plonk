extends Node2D

var ball = preload("res://scenes/ball.tscn")
var block = preload("res://scenes/block.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	genBox(32, 24, Vector2(50, 50))
	spawnBall(100, 100)
	spawnBall(250, 150, Vector2(150, -150))

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

func spawnBall(x, y, vel = Vector2(100, 100)) -> void:
	var instance = ball.instantiate()
	add_child(instance)
	instance.position = Vector2(x, y)
	instance.linear_velocity = vel
	

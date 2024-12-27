extends RigidBody2D

var speed = 50
var rotation_speed = 10
var scaler = 1.0

var rotation_direction = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	angular_velocity = 0
	scale = Vector2(Global.plonkyScale, Global.plonkyScale) * scaler
	$CollisionShape2D.scale = scale
	# position = Vector2(100, 100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$AnimatedSprite2D.play("idle")
	
	scale = Vector2(Global.plonkyScale, Global.plonkyScale) * scaler
	$CollisionShape2D.scale = scale
	get_input()
	angular_velocity += rotation_direction * rotation_speed * delta

func get_input():
	rotation_direction = Input.get_axis("rotatecw", "rotateccw")
	var input_direction = Input.get_vector("left", "right", "up", "down")
	linear_velocity = input_direction * speed

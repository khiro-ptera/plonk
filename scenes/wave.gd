extends StaticBody2D

var timer = 1.0
var rand = randf_range(0.00, 3.14)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	scale = Vector2(2, 2) * Global.plonkiScale
	# var rand = randf_range(0.00, 3.14)
	rotate(rand)
	position += Vector2(1, 1).rotated(rand)
	constant_linear_velocity = Vector2(1, 1).rotated(rand)
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CollisionPolygon2D.disabled = true
	timer -= delta
	scale = (2.0 - timer) * Vector2(2, 2) * Global.plonkiScale
	if timer < 0.0:
		queue_free()

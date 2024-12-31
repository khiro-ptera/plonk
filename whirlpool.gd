extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(0.005)
	$Sprite2D.rotate(0.02)
	# $WPArea/CollisionShape2D.scale = scale

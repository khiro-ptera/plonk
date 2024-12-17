extends StaticBody2D

@onready var scaler = 0.2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scale = scale * scaler
	# $CollisionShape2D.scale = scale

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends RigidBody2D

@onready var scaler = 0.2
@onready var oscale = scale

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	oscale = scale
	scale = scale * scaler
	$AnimatedSprite2D.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	scale = oscale * scaler
	$CollisionShape2D.scale = scale
	if randi_range(1, 10) == 1:
		$AnimatedSprite2D.play("default")

func _on_body_entered(body: Node) -> void:
	Global.plonks += 1
	$AnimatedSprite2D.play("hit_block")

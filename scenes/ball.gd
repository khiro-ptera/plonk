extends RigidBody2D

@onready var scaler = 0.2
@onready var oscale = Vector2(1, 1)
@onready var type = 0
var hitframes = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	oscale = scale
	scale = scale * scaler
	$AnimatedSprite2D.play("0_mid")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	scale = oscale * scaler
	
	if type == 2:
		$BallSprite.hide()
		$StarSprite.show()
		$CollisionPolygonStar.disabled = false
		$CollisionShapeBall.disabled = true
		# angular_velocity += 0.05 / (angular_velocity + 0.0001)
	else:
		$BallSprite.show()
		$StarSprite.hide()
		$CollisionPolygonStar.disabled = true
		$CollisionShapeBall.disabled = false
		#pass
	
	$CollisionShapeBall.scale = scale
	$CollisionPolygonStar.scale = scale
	if hitframes == 0:
		if abs(linear_velocity.x) + abs(linear_velocity.y) > 250:
			$AnimatedSprite2D.play(str(type) + "_fast")
		elif abs(linear_velocity.x) + abs(linear_velocity.y) < 150:
			$AnimatedSprite2D.play(str(type) + "_slow")
		else:
			$AnimatedSprite2D.play(str(type) + "_mid")
	hitframes -= 1

func _on_body_entered(body: Node) -> void:
	Global.plonks += 1
	hitframes = 15
	$AnimatedSprite2D.play(str(type) + "_hit")

extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	run()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func run() -> void:
	hide()
	modulate.a = randf_range(0.3, 0.7)
	scale *= randf_range(0.8, 1.1)
	rotate(randf_range(0.00, 3.14))
	await get_tree().create_timer(randf_range(0.00, 0.25)).timeout
	play("0")
	show()
	for i in randi_range(10, 20):
		rotate(0.1)
		await get_tree().create_timer(0.05).timeout
		scale *= 1.1
		modulate.a *= 0.8
	queue_free()

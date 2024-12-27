extends Area2D

var _contacted = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(other) -> void:
	_contacted = other
	_contacted.linear_velocity += Vector2(randi_range(-15, 15), randi_range(-15, 15))

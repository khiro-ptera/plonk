extends Node2D

var card = preload("res://scenes/boon_card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.boons > 0:
		visible = true

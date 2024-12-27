extends VBoxContainer

var card = preload("res://scenes/boon_card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in get_child_count():
		var c = get_child(i)
		c.position.y = 20 * i


func _on_boon_deck_add_boon(b: Variant) -> void:
	pass

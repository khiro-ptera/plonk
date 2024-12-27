extends VBoxContainer

var card = preload("res://scenes/boon_card.tscn")
var deck = preload("res://otherscripts/decklist.gd")
@onready var decksize = deck.cards.size()

signal addBoon(b)

enum{
	Deck, 
	Drawn,
	Active, 
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	decksize = deck.cards.size()
	for i in get_child_count():
		if get_child(i).state == Active:
			var c = get_child(i)
			visible = false
			deck.cards.erase(c.boonName)
			Global.active.append(c.boonName)
			addBoon.emit(c.boonName)
			c.scaler = 0.4
			c.reparent($"../VBoxContainer2/HBoxContainer/BoonBox/MarginContainer2/ActiveBoons")
			for j in get_child_count():
				get_child(j).queue_free()
			break

func _on_draw_boon_pressed() -> void:
	Global.boons -= 1
	
	var nCard = card.instantiate()
	var selected = randi() % decksize
	# nCard.scale *= scaler
	nCard.boonName = deck.cards[selected]
	$".".add_child(nCard)
	
	nCard.state = Drawn
	
	var nCard2 = card.instantiate()
	var selected2 = randi() % decksize
	# nCard2.scale *= scaler
	nCard2.boonName = deck.cards[selected2]
	$".".add_child(nCard2)
	
	nCard2.state = Drawn

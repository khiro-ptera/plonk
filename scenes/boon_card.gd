extends MarginContainer

@onready var boondb = preload("res://otherscripts/boondb.gd")
var boonName = "Scaleballs"
@onready var boonI = boondb[boonName]
@onready var boonInfo = boondb.DATA[boonI].duplicate()
var scaler = 0.4

enum{
	Deck, 
	Drawn,
	Active, 
}

var state = Deck

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CardText/Top/Label.text = boonInfo[1]
	$CardText/Desc/Label.text = boonInfo[2]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if state == Deck:
		$Back.visible = true
	else:
		$Back.visible = false

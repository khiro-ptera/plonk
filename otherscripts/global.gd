extends Node

# player currencies
var plonks = 0
var boons = 0

# acheivements
var bbUnlock = false
var starUnlock = false
var gravUnlock = false

# costs
var ballCost = 1
var bigBallCost = 3
var starCost = 5
var gravCost = 50

# modifiers
var plonkGain = 1
var plonkMult = 1 # NEVER ADD TO THIS VALUE
var eventTime = 15.0 # MAX 60.0
var plonkyScale = 0.2

# stats
var prestige = 0
var totalCollisions = 0
var totalLV = 0
var totalAV = 0

# boons
var shockwave = false
var spincellerate = false
var smallwalls = false
var bigballs = false
var doubleplonkchance = false
var plonkyunlock = false

# other/control
var landName = "Plonkland"

func resetPrices() -> void:
	var ballCost = 1
	var bigBallCost = 3
	var starCost = 5
	var gravCost = 50

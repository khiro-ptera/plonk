extends Node

# player currencies
var plonks = 0
var boons = 0

# acheivements
var bbUnlock = false
var starUnlock = false
var gravUnlock = false
var cometUnlock = false
var slothUnlock = false
var quantUnlock = false

# costs
var ballCost = 1
var bigBallCost = 5
var starCost = 25
var gravCost = 98
var cometCost = 500
var slothCost = 999
var quantCost = randi_range(1000, 1200)

# modifiers
var plonkGain = 1
var plonkMult = 1 # NEVER ADD TO THIS VALUE
var plonkiScale = 0.2
var critRate = 0.01
var critMult = 2
var eventTime = 15.0 # MAX 60.0
var plonkyScale = 0.2
var spin = 0.0

# stats
var prestige = 0
var totalCollisions = 0
var totalLV = 0
var totalAV = 0

# boons
var active = []

# other/control
var landName = "Plonkland"
var muted = false

func resetPrices() -> void:
	ballCost = 1
	bigBallCost = 5
	starCost = 25
	gravCost = 98
	cometCost = 500
	slothCost = 999
	quantCost = randi_range(1000, 1200)
	

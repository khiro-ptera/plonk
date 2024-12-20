extends Node

var plonks = 0
var prestige = 0
var boons = 0

var ballCost = 1
var bigBallCost = 3
var starCost = 5
var gravCost = 50

var plonkGain = 1
var plonkMult = 1 # NEVER ADD TO THIS VALUE
var eventTime = 15.0 # MAX 60.0
var plonkyScale = 0.2

var totalCollisions = 0
var totalLV = 0
var totalAV = 0

func resetPrices() -> void:
	var ballCost = 1
	var bigBallCost = 3
	var starCost = 5
	var gravCost = 50

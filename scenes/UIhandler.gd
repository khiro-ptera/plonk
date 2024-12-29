extends MarginContainer

var dialogue = 0
var inDialogue = false
var dialogueFace = 0
var shopPage = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".custom_minimum_size = get_viewport().size
	$VBoxContainer2/HBoxContainer/ObjBox.custom_minimum_size.x = get_viewport().size.x * 800 / 1152
	$VBoxContainer2/HBoxContainer/ShopBox.custom_minimum_size.x = get_viewport().size.x * 120 / 1152
	$VBoxContainer2/HBoxContainer/BoonBox.custom_minimum_size.x = get_viewport().size.x * 120 / 1152
	loadDialogue(":)... :] >_O :3? >:0, 0.o >.<!", 0)
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall.disabled = true
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall2.disabled = true
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall3.disabled = true
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall4.disabled = true
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall5.disabled = true
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall6.disabled = true
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall7.disabled = true
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall8.disabled = true
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall9.disabled = true
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall10.disabled = true
	$BoonSelection.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$".".custom_minimum_size = get_viewport().size
	
	# section sizing
	$VBoxContainer2/HBoxContainer/ObjBox.custom_minimum_size.x = get_viewport().size.x * 800 / 1152
	$VBoxContainer2/HBoxContainer/ShopBox.custom_minimum_size.x = get_viewport().size.x * 120 / 1152
	$VBoxContainer2/HBoxContainer/BoonBox.custom_minimum_size.x = get_viewport().size.x * 120 / 1152
	
	# shop artifacts
	$VBoxContainer2/HBoxContainer/ShopBox/Label.text = str(Global.plonks)
	$VBoxContainer2/HBoxContainer/ShopBox/Label.size = $VBoxContainer2/HBoxContainer/ShopBox.size
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall/Label.text = "Plonkus " + str(Global.ballCost)
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall/Label.size = $VBoxContainer2/HBoxContainer/ShopBox/AddBall.size
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall2/Label.text = "Big " + str(Global.bigBallCost)
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall2/Label.size = $VBoxContainer2/HBoxContainer/ShopBox/AddBall2.size
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall3/Label.text = "Stonkus " + str(Global.starCost)
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall3/Label.size = $VBoxContainer2/HBoxContainer/ShopBox/AddBall3.size
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall4/Label.text = "Gronkus " + str(Global.gravCost)
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall4/Label.size = $VBoxContainer2/HBoxContainer/ShopBox/AddBall4.size
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall5/Label.text = "Comet " + str(Global.cometCost)
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall5/Label.size = $VBoxContainer2/HBoxContainer/ShopBox/AddBall5.size
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall6/Label.text = "Slothus " + str(Global.slothCost)
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall6/Label.size = $VBoxContainer2/HBoxContainer/ShopBox/AddBall6.size
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall7/Label.text = "Quantus " + str(Global.quantCost)
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall7/Label.size = $VBoxContainer2/HBoxContainer/ShopBox/AddBall7.size
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall8/Label.text = "Scriball " + str(Global.scribCost)
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall8/Label.size = $VBoxContainer2/HBoxContainer/ShopBox/AddBall8.size
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall9/Label.text = "Spookus " + str(Global.spookCost)
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall9/Label.size = $VBoxContainer2/HBoxContainer/ShopBox/AddBall9.size
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall10/Label.text = "Chirus " + str(Global.chiroCost)
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall10/Label.size = $VBoxContainer2/HBoxContainer/ShopBox/AddBall10.size
	
	if shopPage == 1:
		get_tree().call_group("shop1", "show")
		get_tree().call_group("shop2", "hide")
	elif shopPage == 2:
		get_tree().call_group("shop2", "show")
		get_tree().call_group("shop1", "hide")
	
	if !Global.bbUnlock:
		if Global.plonks > 9 && !inDialogue && dialogue == -1:
			Global.bbUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall2.disabled = false
			loadDialogue("I c uve collected 10 plonks! Ill give u the big plonkus license!
			U can now hire big plonki, which r hulking variants of the classic plonkus.", -2)
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall2/Label.text = "Big Plonkus " + str(Global.bigBallCost)
		else:
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall2/Label.text = "???"
		
	if !Global.starUnlock:
		if Global.totalCollisions > 124 && !inDialogue && dialogue == -1:
			Global.starUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall3.disabled = false
			loadDialogue("Uve plonked 125 times! Awesomesauce! I now permit u 2 employ stonki!", 20)
		else:
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall3/Label.text = "???"
		
	if !Global.gravUnlock:
		if Global.totalLV > 1960 && !inDialogue && dialogue == -1:
			Global.gravUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall4.disabled = false
			loadDialogue("Wowzers! Those r sum FAST plonki! I think uve earned the gronkus license!", 25)
		else:
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall4/Label.text = "???"
		
	if !Global.cometUnlock:
		if Global.plonks > 4999 && !inDialogue && dialogue == -1:
			Global.cometUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall5.disabled = false
			loadDialogue("4 reaching 5k plonks, i present 2u... Cometz! 
			They go slow... then they go fast! Give em a shot!", -2)
		else:
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall5/Label.text = "???"
	
	if !Global.slothUnlock:
		$VBoxContainer2/HBoxContainer/ShopBox/AddBall6/Label.text = "???"
		
	if !Global.quantUnlock:
		if Global.totalLV > 3333 && Global.totalAV > 55.55 && Global.prestige > 0 && !inDialogue && dialogue == -1:
			Global.quantUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall7.disabled = false
			loadDialogue("Hold on, i just got a call from dr.quant, 
			Plonkworld's most renowned physicist.", 175, 2)
		else:
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall7/Label.text = "???"
		
	if !Global.scribUnlock:
		if Global.active.size() >= 2 && Global.quantUnlock && !inDialogue && dialogue == -1:
			Global.scribUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall8.disabled = false
			loadDialogue("HELLO THERE! It has come to my attention that YOU
			have unlocked TWO whole boons!", 200, 12)
		else:
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall8/Label.text = "???"
		
	if !Global.spookUnlock:
		if Global.prestige >= 1 && Global.ballCost > 6666 && !inDialogue && dialogue == -1:
			Global.spookUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall9.disabled = false
			loadDialogue("Boo!", 220, 2)
		else:
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall9/Label.text = "???"
		
	if !Global.chiroUnlock:
		if Global.prestige >= 1 && Global.totalCollisions > 100000 && !inDialogue && dialogue == -1:
			Global.chiroUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall10.disabled = false
			loadDialogue("Looks like the chiri r on da hunt!
			They noticed uve reached 100000 total collisions!", 250, 2)
		else:
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall10/Label.text = "???"
	
	# boon/shop artifacts
	$VBoxContainer2/HBoxContainer/BoonBox/Label.size.x = $VBoxContainer2/HBoxContainer/BoonBox.size.x
	$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon/Label.size = $VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.size
	if Global.prestige == 0:
		$VBoxContainer2/HBoxContainer/BoonBox/Label.text = "???"
		$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.visible = false
		$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.disabled = true
	else:
		$VBoxContainer2/HBoxContainer/BoonBox/Label.text = "Boons: " + str(Global.boons)
		$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon/Label.text = "Draw Boon"
		$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.visible = true
		if Global.boons == 0:
			$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.disabled = true
		else:
			$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.disabled = false
	
	# dialogue
	if dialogue == -1 && !inDialogue:
		$DialogueBox.hide()
	else:
		$DialogueBox/Sprite2D.position.y = -120
		$DialogueBox/Sprite2D/DialogueChar.play(str(dialogueFace))
		if dialogueFace >= 10 && dialogueFace <20:
			$DialogueBox/Sprite2D/DialogueChar.offset.y = -100
		else:
			$DialogueBox/Sprite2D/DialogueChar.offset.y = 0
		$DialogueBox.show()

func _on_next_page_pressed() -> void:
	shopPage += 1
	if shopPage == 3: # max shop page + 1
		shopPage = 1

func loadDialogue(d: String, next: int, face: int = 0) -> void:
	$DialogueBox.disabled = true
	dialogueFace = face
	inDialogue = true
	var s = ""
	for i in d.length():
		s += d[i]
		$DialogueBox/Dialogue.text = s
		await get_tree().create_timer(0.02).timeout
	dialogue = next
	$DialogueBox.disabled = false
	inDialogue = false

func _on_draw_boon_pressed() -> void:
	$BoonSelection.visible = true

func _on_objects_prestige() -> void:
	$VBoxContainer2/HBoxContainer/ShopBox/AddBall.disabled = false
	if Global.prestige == 1:
		if !Global.slothUnlock:
			Global.slothUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall6.disabled = false
		loadDialogue("Heya, I c uve prestiged! Gratz!", 100)
		Global.plonks += 1
	else: 
		loadDialogue("Another day, another prestige!
		Here's ur plot!", -2)
		Global.plonks += 1

func _on_objects_plonky_dia() -> void:
	loadDialogue("OMG u drew the 1 of a kind special boon!", 150, 2)

func _on_dialogue_box_pressed() -> void:
	match dialogue:
		-2:
			dialogue = -1
		-1:
			loadDialogue("how r u seeing this... >:(", -1)
		0:
			loadDialogue("Wait a min! U dont look like ur from here... Maybe u speak humanese?", 1, 2)
		1:
			loadDialogue("U do! Welcome 2 Plonkworld! We havent gotten visitorz in soo long!", 2, 3)
		2:
			loadDialogue("My namez Plonky! Im a bit ofa HUGE deal round here! :>", 3)
		3: 
			loadDialogue("And well. Thatz cuz... im da mayor of Plonktopolis! In the pixelz!", 4, 3)
		4: 
			loadDialogue("...Not impressed, huh?", 5, 1)
		5: 
			loadDialogue("Yea, yeah, i dont blame u. The city haznt been in da best shape lately, 
			i admit... The Plonkconomy iz down. Unemplonkment iz at an all time high. ", 6, 1)
		6: 
			loadDialogue("And, worst of all, everyplonkz losing their passion 4 Plonking!", 7, 2)
		7: 
			loadDialogue("Say, wont u help a plonkus in need? U look like a dependable fella.", 8)
		8: 
			loadDialogue("Ill let u handle this lot of Plonktopolis. 
			Itz called Plonkland, but u can call it whatevr u want.", 9)
		9: 
			loadDialogue("Yes? OK, itz settled then! I will leave Plonkland in ur capable hands!", 10, 3)
		10: 
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall.disabled = false
			Global.plonks += 1
			loadDialogue("Start off by buying a plonkus with the 1 plonk ive graciously provided u.", 11)
		11: 
			loadDialogue("Now watch as ur plonks go up whenever ur plonkus plonks!", 12)
		12: 
			loadDialogue("U get it now? Okie dokey, glhf! I got other stuffz 2 do so cya 4 now!", -2)
			
		20:
			loadDialogue("A stonkus iz a totally radical plonkus thatz a bit edgy. Dont get hurt!", -2)
		25:
			loadDialogue("Gronki r alwaysz being weighed down. 
			Itz called gravy tee or something, idk.", -2)
		
		
		100:
			loadDialogue("That meanz i will b taking that land back.", 101)
		101:
			loadDialogue("But wait dont b upset!", 102, 2)
		102:
			loadDialogue("Ill give u a new plot, and a boon token 4 every 10000 plonks u had!", 103, 3)
		103:
			loadDialogue("U can use tokenz 2 draw permanent boon cards 2 help u on ur next land!", 104)
		104:
			loadDialogue("Ive also unlocked the sloth plonkus 4 u.", 105)
		105:
			loadDialogue("Slothus 4 short. They give HUGE plonk bonuses!", 106, 2)
		106:
			loadDialogue("BUT b careful! They will drag ur other plonks down!", 107, 1)
		107:
			if Global.active.has("Plonky"):
				loadDialogue("Okie, letz get 2 work!", -2, 3)
			else:
				loadDialogue("Okie, glhf! Im outta here!", -2, 3)
		
		150:
			loadDialogue("I was hoping u wouldnt draw this 1 ngl...", 151, 1)
		151:
			loadDialogue("But ig u deserve it for all ur help.", 152)
		152:
			loadDialogue("From now on i will help u on ur land.", 153)
		153:
			loadDialogue("Use wasd 2 command me around!", -2)
		
		175:
			loadDialogue("He said he finally got his cloning machine 2 work!", 176, 2)
		176:
			loadDialogue("Well, it can only clone himself rn...", 177, 1)
		177:
			loadDialogue("He says i can use his clones to plonk!", 178, 3)
		178:
			loadDialogue("But um... Im not 2 sure how well they work... 
			What if theres some catastrophic malfunction?", 180, 1)
		180:
			loadDialogue("How bout i let u test them first!", 181, 3)
		181:
			loadDialogue("Hrm? Wdym? Whats a \"ginney pig?\" 
			No, ur just my assistant, ofc.", 182, 1)
		182:
			loadDialogue("I wud never put u in danger, trust me!", -2, 3)
		
		200:
			loadDialogue("Ah, my apologies! I have not introduced myself yet!", 201, 10)
		201:
			loadDialogue("I am DOCTOR Quant Quonkus! Professor of BIOCHEMISTRY, PSYCHOLOGY,
			QUANTUM PHYSICS, MATERIAL SCIENCES, MECHANICAL ENGINEERING, HISTORY,", 202, 12)
		202:
			loadDialogue("STATISTICS, LITERATURE, MARine biology, *pant* park management, 
			finance, plonkonomics, art history, and linguistics at Plonktech University. *pant*", 203, 11)
		203:
			loadDialogue("Huh? You already know me?", 204, 10)
		204:
			loadDialogue("EGADS! I see you have employed my likeness onto your plonkosystem!", 205, 12)
		205:
			loadDialogue("Well, anywho! I'm here in the mayor's stead at his behest.", 206, 10)
		206:
			loadDialogue("I must inform you that you can now utilize my NEWEST creation!", 207, 12)
		207:
			loadDialogue("BEHOLD! The SCRIBALL!", 208, 12)
		208:
			loadDialogue("I've engineered this synthetic plonkus with the science of SIZOLOGY!
			Not only will its size change with every plonk...", 209, 12)
		209:
			loadDialogue("But it will ALSO grant additional plonks based on its size!
			Give it a try! I'll be off now!", 210, 12)
		210:
			loadDialogue("Goodbye! Ciao! 再见! Kwaheri! ;D o7!", -2, 12)
			
		220:
			loadDialogue("Did i getcha?", 221)
		221:
			loadDialogue("Uve unlocked the spoOoo00o00oO0oOkus! 
			A hi-plonk plonkus that leaves ghastly afterimages!", -2, 2)
			
		250:
			loadDialogue("Say, they can help u plonk! Theyre great hunters!
			They can detect nearby plonkus with their sharp hearing!", -2)

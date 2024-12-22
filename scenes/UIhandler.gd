extends MarginContainer

var dialogue = 0
var inDialogue = false
var dialogueFace = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".custom_minimum_size = get_viewport().size
	$VBoxContainer2/HBoxContainer/ObjBox.custom_minimum_size.x = get_viewport().size.x * 800 / 1152
	$VBoxContainer2/HBoxContainer/ShopBox.custom_minimum_size.x = get_viewport().size.x * 120 / 1152
	$VBoxContainer2/HBoxContainer/BoonBox.custom_minimum_size.x = get_viewport().size.x * 120 / 1152
	if Global.prestige == 0:
		loadDialogue(":)... :] >_O :3? >:0 0.o >.<!", 0)
		$VBoxContainer2/HBoxContainer/ShopBox/AddBall.disabled = true
		$VBoxContainer2/HBoxContainer/ShopBox/AddBall2.disabled = true
		$VBoxContainer2/HBoxContainer/ShopBox/AddBall3.disabled = true
		$VBoxContainer2/HBoxContainer/ShopBox/AddBall4.disabled = true
		$VBoxContainer2/HBoxContainer/ShopBox/AddBall5.disabled = true
	elif Global.prestige == 1:
		loadDialogue("Heya, I c uve prestiged! Gratz!", 100)
		Global.plonks += 1
	else: 
		loadDialogue("Another day, another prestige!
		Here's ur plot!", -2)
		Global.plonks += 1

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
	
	if Global.bbUnlock == false:
		if Global.plonks > 9 && !inDialogue:
			Global.bbUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall2.disabled = false
			loadDialogue("I c uve collected 10 plonks! Ill give u the big plonkus license!
			U can now hire big plonki, which are hulking variants of the classic plonkus.", -2)
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall2/Label.text = "Big Plonkus " + str(Global.bigBallCost)
		else:
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall2/Label.text = "???"
		
	if Global.starUnlock == false:
		if Global.totalCollisions > 124 && !inDialogue:
			Global.starUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall3.disabled = false
			loadDialogue("Uve plonked 125 times! Awesomesauce! I now permit u to employ stonki!", 20)
		else:
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall3/Label.text = "???"
		
	if Global.gravUnlock == false:
		if Global.totalLV > 1960 && !inDialogue:
			Global.gravUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall4.disabled = false
			loadDialogue("Wowzers! Those r sum FAST plonki! I think uve earned the gronkus license!", 25)
		else:
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall4/Label.text = "???"
		
	if Global.cometUnlock == false:
		if Global.plonks > 4999 && !inDialogue:
			Global.cometUnlock = true
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall5.disabled = false
			loadDialogue("4 reaching 5k plonks, i present 2u... Cometz! 
			They go slow... then they go fast! Give em a shot!", -2)
		else:
			$VBoxContainer2/HBoxContainer/ShopBox/AddBall5/Label.text = "???"
	
	# boon/shop artifacts
	$VBoxContainer2/HBoxContainer/BoonBox/Label.size.x = $VBoxContainer2/HBoxContainer/BoonBox.size.x
	if Global.prestige == 0:
		$VBoxContainer2/HBoxContainer/BoonBox/Label.text = "???"
		$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.visible = false
		$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon.disabled = true
	else:
		$VBoxContainer2/HBoxContainer/BoonBox/Label.text = "Boons"
		$VBoxContainer2/HBoxContainer/BoonBox/DrawBoon/Label.text = str(Global.boons)
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
		$DialogueBox.show()

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
	pass # Replace with function body.

func _on_dialogue_box_pressed() -> void:
	match dialogue:
		-2:
			dialogue = -1
		-1:
			loadDialogue("how r u seeing this... >:(", -1)
		0:
			loadDialogue("Wait a min! U dont look like ur from here... Maybe u speak humanese?", 1, 2)
		1:
			loadDialogue("U do! Welcome to Plonkworld! We havent gotten visitorz in so long!", 2, 3)
		2:
			loadDialogue("My namez Plonky! Im a bit of a HUGE deal round here! :>", 3)
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
			loadDialogue("Now watch as ur plonks go up whenever your plonkus plonks!", 12)
		12: 
			loadDialogue("U get it now? Okie dokey, glhf! I got other stuffz to do so cya 4 now!", -2)
			
		20:
			loadDialogue("A stonkus iz a totally radical plonkus thatz a bit edgy. Dont get hurt!", -2)
		25:
			loadDialogue("Gronki r alwaysz being weighed down. 
			Itz called gravy tee or something, idk.", -2)
		
		
		100:
			loadDialogue("That meanz i will b taking that land back.", 101)
		101:
			loadDialogue("But wait dont b upset!", -102, 2)
		102:
			loadDialogue("Ill give u a new plot, and a boon token 4 every 10000 plonks u had!", 103, 3)
		103:
			loadDialogue("U can use tokenz to draw permanent boon cards to help u on ur next land!", 104)
		104:
			loadDialogue("Okie, glhf! Im outta here!", -2, 3)

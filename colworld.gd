extends Node2D

var initPos = Vector2(216, 447)
var theGui

var whiteOut = load("res://whiteOut.tscn") 

func _on_princess_body_enter(body):
	# The name of this editor-generated callback is unfortunate
	if body.get_name() == "player":
		$youwin.show()
		
func _ready():
	var gui = load("res://GUI.tscn") 
	var prePause = load("res://PauseContainer.tscn") 
	theGui = gui.instance()
	var thePause = prePause.instance()
	
	add_child(theGui)
	theGui.add_child(thePause)
	for N in get_children():
		if "Coin" in N.get_name():
			N.connect("collect", self, "getCoin")
	get_node("player").connect("death", self, "die")
	theGui.get_node("MarginContainer/HBoxContainer/VBoxContainer/CashText").connect("freeze", self, "freezePlayer")
	get_tree().paused = true

func die():
	theGui.get_node("MarginContainer/HBoxContainer2/VBoxContainer2/DeathText").die()
	theGui.get_node("MarginContainer/HBoxContainer/VBoxContainer/CashText").resetCoin()
	theGui.add_child(whiteOut.instance())
	
func getCoin():
	get_node("coinsound").play()
	print("play")
	theGui.get_node("MarginContainer/HBoxContainer/VBoxContainer/CashText").getCoin()
	
func freezePlayer():
	get_node("player").freeze()
extends Node2D

var initPos = Vector2(233, 223)
var theGui

func _on_princess_body_enter(body):
	# The name of this editor-generated callback is unfortunate
	if body.get_name() == "player":
		$youwin.show()
		
func _ready():
	var gui = load("res://GUI.tscn") 
	theGui = gui.instance();
	
	add_child(theGui)
	for N in get_children():
		if "Coin" in N.get_name():
			N.connect("collect", self, "getCoin")
	get_node("player").connect("death", self, "die")
	theGui.get_node("MarginContainer/HBoxContainer/VBoxContainer/CashText").connect("freeze", self, "freezePlayer")

func die():
	theGui.get_node("MarginContainer/HBoxContainer2/VBoxContainer2/DeathText").die()
	
func getCoin():
	theGui.get_node("MarginContainer/HBoxContainer/VBoxContainer/CashText").getCoin()
	
func freezePlayer():
	get_node("player").freeze()
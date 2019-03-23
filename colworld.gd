extends Node2D

var initPos = Vector2(233, 223)

func _on_princess_body_enter(body):
	# The name of this editor-generated callback is unfortunate
	if body.get_name() == "player":
		$youwin.show()
		
func _ready():
	get_node("player").connect("death", self, "die")

func die():
	get_node("GUI/MarginContainer/HBoxContainer2/VBoxContainer2/DeathText").die()
extends Node2D

var initPos = Vector2(233, 223)

func _on_princess_body_enter(body):
	# The name of this editor-generated callback is unfortunate
	if body.get_name() == "player":
		$youwin.show()

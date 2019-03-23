extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color8(255, 255, 255, 100)

func set_pos(thePosition):
	position = thePosition
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

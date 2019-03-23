extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rect
# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color8(100, 100, 100, 100)
	get_node("sprite").set_region_rect(rect)
	get_node("sprite").set_region_rect(rect)
	get_node("sprite").set_region_rect(rect)

func set_pos(thePosition):
	position = thePosition
	
func set_skin(rect):
	self.rect = rect
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

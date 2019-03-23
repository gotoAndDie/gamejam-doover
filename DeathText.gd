extends RichTextLabel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var deaths = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	clear()
	add_text("Deaths: " + str(deaths))
	

func die():
	deaths += 1
	clear()
	add_text("Deaths: " + str(deaths))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

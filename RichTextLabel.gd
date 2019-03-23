extends RichTextLabel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const INITIAL_CASH = 1000
var cash;
var scene = load("res://GameOverContainer.tscn")
var scene_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	cash = INITIAL_CASH

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	clear()
	add_text("$" + str(int(cash)))
	if(cash <= 0):
		scene_instance = scene.instance()
		get_parent().get_parent().add_child(scene_instance)
	else:
		cash -= 120 * delta
	  
	

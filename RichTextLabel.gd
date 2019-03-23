extends RichTextLabel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const INITIAL_CASH = 2000
var cash;
var scene = load("res://GameOverContainer.tscn")
var scene_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	cash = INITIAL_CASH

signal freeze
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	clear()
	add_text("$" + comma_sep(int(cash)) + ",000")
	if(cash <= 0):
		scene_instance = scene.instance()
		get_parent().get_parent().get_parent().get_parent().add_child(scene_instance)
		emit_signal("freeze")
		queue_free()
	else:
		cash -= 120 * delta
	  
func getCoin():
	cash += 100;
	
func resetCoin():
	cash = INITIAL_CASH

func comma_sep(number):
    var string = str(number)
    var mod = string.length() % 3
    var res = ""

    for i in range(0, string.length()):
        if i != 0 && i % 3 == mod:
            res += ","
        res += string[i]

    return res


	

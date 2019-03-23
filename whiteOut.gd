extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var alpha = 255
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	alpha -= 500 * delta
	modulate = Color8(255, 255, 255, alpha)

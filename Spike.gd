extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var neutral_spike = load("res://img/blunt_spike.png")
var isNeutral = false

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "body_entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func body_entered(body):
	if body.has_method("out") && !isNeutral:
		body.out()
		get_node("Sprite").texture = neutral_spike
		isNeutral = true
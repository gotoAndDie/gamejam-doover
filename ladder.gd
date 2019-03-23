extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "body_entered")
	connect("body_exited", self, "body_exited")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func body_entered(body):
	if body.has_method("isClimbing"):
		body.isClimbing()
func body_exited(body):
	if body.has_method("notClimbing"):
		body.notClimbing()
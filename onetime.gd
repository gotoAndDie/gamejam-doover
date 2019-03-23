extends Area2D

# Declare member variables here. Examples
var collider
var normal_platform = load("res://long_obstacle.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_exited", self, "body_exited")
	collider = get_node("Collider")
	collider.collision_layer = 0
	collider.collision_mask = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass
func body_exited(body):
	print("hi")
	if body.has_method("out"): # Only players can be out
		get_node("Sprite").texture = normal_platform
		collider.collision_layer = 1
		collider.collision_mask = 1
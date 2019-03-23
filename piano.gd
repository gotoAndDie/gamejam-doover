extends KinematicBody2D

const GRAVITY = 800.0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,0)
var start = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func start():
	start = true
	
func _physics_process(delta):
	# Create forces
	if start:
		var force = Vector2(0, GRAVITY)
		velocity += force * delta
		position += velocity * delta
	

# Called every frame. 'delta' is the elapsed time since the previous frame.

#func body_entered(body):
extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const DIRECTION_HOLD = 1
const GRAVITY = 800.0
var direction_progress = DIRECTION_HOLD
var direction = 200
var yVelocity = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	print(direction)
	var collision
	direction_progress -= delta;
	if direction_progress <= 0:
		direction = -direction
		direction_progress = DIRECTION_HOLD
	#yVelocity += GRAVITY * delta
	if is_on_floor():
		yVelocity = -10
		position.y -= 5
	collision = move_and_collide(Vector2(direction * delta, yVelocity))
	if collision:
		if collision.get_collider().has_method("push"):
			collision.get_collider().push(direction);
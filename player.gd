extends KinematicBody2D

# This demo shows how to build a kinematic controller.

# Member variables
const GRAVITY = 800.0 # pixels/second/second

# Angle in degrees towards either side that the player can consider "floor"
const FLOOR_ANGLE_TOLERANCE = 40
const WALK_FORCE = 1200
const WALK_MIN_SPEED = 10
const WALK_MAX_SPEED = 200
const STOP_FORCE = 1300
const JUMP_SPEED = 300
const DOUBLE_JUMP_SPEED = 250
const JUMP_MAX_AIRBORNE_TIME = 0.2

const SLIDE_STOP_VELOCITY = 1.0 # one pixel/second
const SLIDE_STOP_MIN_TRAVEL = 1.0 # one pixel

var velocity = Vector2()
var on_air_time = 100
var jumping = false
var double_jumping = false

var prev_jump_pressed = false
var isClimbing = false

var up
var down
var freeze = false
func _ready():
	pass
func _physics_process(delta):
	# Create forces
	var force = Vector2(0, GRAVITY)
	
	var walk_left = Input.is_action_pressed("move_left")
	var walk_right = Input.is_action_pressed("move_right")
	up = Input.is_action_pressed("ui_up")
	down = Input.is_action_pressed("ui_down")
	var jump = Input.is_action_pressed("jump")
	
	var stop = true
	
	if walk_left:
		if velocity.x <= WALK_MIN_SPEED and velocity.x > -WALK_MAX_SPEED:
			force.x -= WALK_FORCE
			stop = false
	elif walk_right:
		if velocity.x >= -WALK_MIN_SPEED and velocity.x < WALK_MAX_SPEED:
			force.x += WALK_FORCE
			stop = false
	
	if stop:
		var vsign = sign(velocity.x)
		var vlen = abs(velocity.x)
		
		vlen -= STOP_FORCE * delta
		if vlen < 0:
			vlen = 0
		
		velocity.x = vlen * vsign
	
	# Integrate forces to velocity
	velocity += force * delta	
	if isClimbing:
		if up:
			velocity.y = -100
		elif down:
			velocity.y = 100
		else:
			velocity.y = 0
		on_air_time = 0
		double_jumping = false
	if freeze:
		velocity = Vector2(0,0)
		if Input.is_action_pressed("ui_cancel"):
			get_tree().change_scene("res://stage1.tscn")
	# Integrate velocity into motion and move
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if is_on_floor():
		on_air_time = 0
		double_jumping = false
		
	if jumping and velocity.y > 0:
		# If falling, no longer jumping
		jumping = false
	
	if on_air_time < JUMP_MAX_AIRBORNE_TIME and jump and not prev_jump_pressed and not jumping:
		# Jump must also be allowed to happen if the character left the floor a little bit ago.
		# Makes controls more snappy.
		velocity.y = -JUMP_SPEED
		jumping = true
		
		
	if on_air_time > JUMP_MAX_AIRBORNE_TIME and jump and not prev_jump_pressed and not double_jumping:
		velocity.y = -DOUBLE_JUMP_SPEED
		double_jumping = true
	
	
	on_air_time += delta
	prev_jump_pressed = jump
	
	
signal death
func out():
	var body = load("res://body.tscn") 
	var theBody = body.instance()
	var newSkin = randi()%3
	var newRect = Rect2(newSkin*16, 0, 16, 32)
	get_node("sprite").set_region_rect(newRect)
	get_parent().add_child(theBody)
	theBody.set_pos(position)
	position = get_parent().initPos
	emit_signal("death")
	
func isClimbing() :
	isClimbing = true
func notClimbing() :
	isClimbing = false
func freeze():
	freeze = true
func push(speed):
	velocity.x = speed

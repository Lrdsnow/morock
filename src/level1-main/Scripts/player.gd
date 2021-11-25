extends KinematicBody2D

# warning-ignore:unused_signal
signal debug

var l = false
var r = false
var j = false

export (int) var speed = 350
export (int) var jump_speed = -1500
export (int) var gravity = 5500
export (int) var slope_stop_min_velocity = 0

export(SpriteFrames) var Ben
export(SpriteFrames) var Bag
export(Vector2) var BagSize
export(Vector2) var BenSize

export(Vector2) var DefaultLocation

export(float) var BenSpeed
export(float) var BagSpeed

export(int) var frame

var ccb = false
var ani = false

var ldir = 0

var velocity = Vector2.ZERO

func _ready():
	$fx.play("fadein")
	show()
	position = DefaultLocation
	csben()

func _physics_process(delta):
	if ani == false:
		get_input(delta)
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity, Vector2.UP)
		if Input.is_action_just_pressed("jump") or j == true:
			if is_on_floor():
				velocity.y = jump_speed
			
export (float, 0, 1.0) var friction = 1
export (float, 0, 1.0) var acceleration = 0.25

# warning-ignore:unused_argument
func get_input(delta):
	var dir = 0
	if Input.is_action_pressed("C1"):
		csben()
	if Input.is_action_pressed("C2"):
		csbag()
	if Input.is_action_pressed("run"):
		speed = 700
	if Input.is_action_pressed("ui_right") or r == true:
		dir += 1
		$playerbody.play("WalkRight")
		if global.m == true:
			ldir = 1
	if Input.is_action_just_released("ui_right") or r == false and ldir == 1:
		dir = 0
		$playerbody.play("IdleRight")
	if Input.is_action_pressed("ui_left") or l == true:
		dir -= 1
		$playerbody.play("WalkLeft")
		if global.m == true:
			ldir = -1
	if Input.is_action_just_released("ui_left") or l == false and ldir == -1:
		dir = 0
		$playerbody.play("IdleLeft")
	if dir != 0:
		if ccb == true:
			velocity.x = lerp(velocity.x, dir * BagSpeed, acceleration)
		else:
			if ccb == false:
				velocity.x = lerp(velocity.x, dir * BenSpeed, acceleration)
	else:
		velocity.x = lerp(0, 0, 0)

func csbag():
	ccb = true
	$playercollison.shape.extents = BagSize
	$playerbody.frames = Bag

func csben():
	ccb = false
	$playercollison.shape.extents = BenSize
	$playerbody.frames = Ben

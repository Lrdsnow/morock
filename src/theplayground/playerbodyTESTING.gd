extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export (int) var speed = 525
export (int) var jump_speed = -1200
export (int) var gravity = 5500
export (int) var slope_stop_min_velocity = 0

var velocity = Vector2.ZERO
var ldir = 0

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	get_input(delta)
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump") == true:
		if is_on_floor():
			velocity.y = jump_speed
		
export (float, 0, 1.0) var friction = 1
export (float, 0, 1.0) var acceleration = 0.25

# warning-ignore:unused_argument
func get_input(delta):
	var dir = 0
	if Input.is_action_pressed("run"):
		speed = 700
	if Input.is_action_pressed("ui_right") == true:
		dir += 1
		$playerbody.play("WalkRight")
		if global.m == true:
			ldir = 1
	if Input.is_action_just_released("ui_right"):
		dir = 0
		$playerbody.play("IdleRight")
	if Input.is_action_pressed("ui_left"):
		dir -= 1
		$playerbody.play("WalkLeft")
		if global.m == true:
			ldir = -1
	if Input.is_action_just_released("ui_left"):
		dir = 0
		$playerbody.play("IdleLeft")
	if Input.is_action_just_pressed("ui_down"):
		pass
		#$"..".crh = true
		#$"..".cfp = false
		#if ! $"..".cyposc:
		#	$playerbody.play("crh")
	if Input.is_action_just_released("ui_down"):
		pass
		#$"..".crh = false
		#$"..".cfp = true
		#$playerbody.play("IdleLeft")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(0, 0, 0)

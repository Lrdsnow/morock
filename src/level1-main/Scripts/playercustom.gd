extends KinematicBody2D

export (int) var speed = 350
export (int) var jump_speed = -1500
export (int) var gravity = 0
export (int) var slope_stop_min_velocity = 0

var ldir = Vector2.ZERO

var velocity = Vector2.ZERO

func _ready():
	show()

func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity, Vector2.UP)
			
export (float, 0, 1.0) var friction = 1
export (float, 0, 1.0) var acceleration = 0.25

# warning-ignore:unused_argument
func get_input(delta):
	var dir = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		dir.y -= 1
		$playerbody.play("walkU")
		if global.m == true:
			ldir.y = 1
	if Input.is_action_just_released("ui_up"):
		dir.y = 0
		$playerbody.play("idleU")
	if Input.is_action_pressed("ui_down"):
		dir.y += 1
		$playerbody.play("walkD")
		if global.m == true:
			ldir.y = 1
	if Input.is_action_just_released("ui_down"):
		dir.y = 0
		$playerbody.play("idleD")
	if Input.is_action_pressed("ui_right"):
		dir.x += 1
		$playerbody.play("walkR")
		if global.m == true:
			ldir.x = 1
	if Input.is_action_just_released("ui_right"):
		dir.x = 0
		$playerbody.play("idleR")
	if Input.is_action_pressed("ui_left"):
		dir.x -= 1
		$playerbody.play("walkL")
		if global.m == true:
			ldir.x = -1
	if Input.is_action_just_released("ui_left"):
		dir.x = 0
		$playerbody.play("idleL")
	if dir.x != 0:
		#position.x = position.x + (dir.x * speed)
		velocity.x = lerp(velocity.x, dir.x * speed, acceleration)
		if dir.y != 0:
			#position.y = position.y + (dir.y * speed)
			velocity.y = lerp(velocity.y, dir.y * speed, acceleration)
	else:
		if dir.y != 0:
			#position.y = position.y + (dir.y * speed)
			velocity.y = lerp(velocity.y, dir.y * speed, acceleration)
		else:
			velocity.x = lerp(0, 0, 0)
			velocity.y = lerp(0, 0, 0)

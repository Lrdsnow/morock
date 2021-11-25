extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var teddy = preload("res://src/tets/teddy.png")
var ben = preload("res://src/tets/ben.png")

# Stupid animation variables:
var outone = false
var outtwo = false
var anionedone = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.get_name() == "OSX" or OS.get_name() == "iOS":
		$"world/lava-1".water_level = 0
		$"world/lava-1".position = Vector2(1732.48, 1068.952)
		$"world/lava-2".water_level = 0
		$"world/lava-2".position = Vector2(6305.48, 1641.951)
	$usr/player.Ben = global.cartex
	$usr/player/playerbody.frames = global.cartex
	$usr/AnimationPlayer/Animation1/playerbody.frames = global.cartex
	if global.car == "3":
		$usr/AnimationPlayer/speak.Ben = teddy
	else:
		if global.car == "1":
			$usr/AnimationPlayer/speak.Ben = ben
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# warning-ignore:unused_argument
func _on_AnimationPlayer_animation_started(anim_name):
	$death.ani = true
	$usr/player.ani = true


# warning-ignore:unused_argument
func _on_AnimationPlayer_animation_finished(anim_name):
	$death.ani = false
	$usr/player.ani = false


# warning-ignore:unused_argument
func _on_solid_body_entered(body):
	pass # Replace with function body.


func _on_Area2D2_body_entered(body):
	if body.name == "player":
		if outone == false:
			if anionedone == true:
				$animation/controls.play("Arrow Keys Hide")
				outone = true


func _on_Area2D_body_entered(body):
	if body.name == "player":
		if outone == false:
			if anionedone == true:
				$animation/controls.play("Arrow Keys Hide")
				outone = true


# warning-ignore:unused_argument
func _on_islandmove_animation_finished(anim_name):
	anionedone = true
	$animation/controls.play("Arrow Keys")


func _on_Area2D4_body_entered(body):
	if body.name == "player":
		if outtwo == false:
			if anionedone == true:
				$animation/controls.play("Space Hide")
				outtwo = true

func _on_Area2D3_body_entered(body):
	if body.name == "player":
		if outtwo == false:
			if anionedone == true:
				$animation/controls.play("Space")


func _on_L_pressed():
	$usr/player.l = true


func _on_L_released():
	$usr/player.l = false


func _on_R_pressed():
	$usr/player.r = true


func _on_R_released():
	$usr/player.r = false


func _on_J_pressed():
	$usr/player.j = true


func _on_J_released():
	$usr/player.j = false

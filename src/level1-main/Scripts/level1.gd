extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var teddy = preload("res://src/tets/teddy.png")
var ben = preload("res://src/tets/ben.png")

# Called when the node enters the scene tree for the first time.
func _ready():
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


func _on_AnimationPlayer_animation_started(anim_name):
	$death.ani = true
	$usr/player.ani = true


func _on_AnimationPlayer_animation_finished(anim_name):
	$death.ani = false
	$usr/player.ani = false

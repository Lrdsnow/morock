extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (Vector2) var start = Vector2.ZERO
export (Vector2) var end = Vector2.ZERO

var cfp = true
var crh = false
var cypos = 0
var cyposc = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$smtcamera.position.y = $player.position.y - 50


func _process(delta):
	if $player.position.x <= start.x:
		cfp = false
	elif $player.position.x >= end.x:
		cfp = false
	else:
		cfp = true
	if cfp:
		$smtcamera.position.x = $player.position.x
	else:
		if crh:
			if ! cyposc:
				cypos = $smtcamera.position.y + 30
				cyposc = true
			$smtcamera.position.x = $player.position.x
			$smtcamera.position.y = cypos
		else:
			if cyposc:
				cyposc = false
			pass

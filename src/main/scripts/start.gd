extends Control

# variables

var dani = false

# animation

func _ready():
	$img/ani.play("start")

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if dani == false:
				$img/ani.play("skip")
			if dani == true:
				$img/fx.play("fadeout")
	else:
		if event is InputEventKey and event.pressed:
			if event.scancode != KEY_ENTER:
				if dani == false:
					$img/ani.play("skip")
				if dani == true:
					$img/fx.play("fadeout")

func _on_ani_animation_finished(anim_name):
	dani = true
	$img/ani.play("pstart")


func _on_fx_animation_finished(anim_name):
	get_tree().change_scene("res://src/sc/sc.tscn")

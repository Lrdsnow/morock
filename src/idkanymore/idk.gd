extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cp = false

var morosurl = global.morosurl

# Called when the node enters the scene tree for the first time.
func _ready():
	$overlay/fade.play("fadein")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Yes_pressed():
	$usr/transition.play("choose path")


func _on_No_pressed():
	$usr/transition.play("thisisnotokwhyhaveunotplayedthegame")


func _on_Play_Moros_pressed():
# warning-ignore:return_value_discarded
	OS.shell_open("https://lrdsnow.itch.io/moros")
	get_tree().quit()


func _on_Continue_Anyways_pressed():
	$usr/transition.play_backwards("thisisnotokwhyhaveunotplayedthegame")
	cp = true

func _on_Normal_mouse_entered():
	$AnimationPlayer.play("Hover Normal")


func _on_Evil_mouse_entered():
	$AnimationPlayer.play("Hover Evil")


func _on_Evil_mouse_exited():
	$AnimationPlayer.play("UnHover Evil")


func _on_Normal_mouse_exited():
	$AnimationPlayer.play("UnHover Normal")


func _on_Evil_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			$overlay/fade.play("fadeout")



func _on_transition_animation_finished(anim_name):
	if anim_name == "thisisnotokwhyhaveunotplayedthegame":
		if cp != false:
			$usr/transition.play("choose path")
			cp = false


func _on_fade_animation_finished(anim_name):
	if anim_name == "fadeout":
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://src/level1-main/level1.tscn")

extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$fx.play("fadein")


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
			$fx.play("fadeout")


func _on_fx_animation_finished(anim_name):
	if anim_name == "fadeout":
		get_tree().change_scene("res://src/level1-main/level1.tscn")

extends Control

# variables

var dani = false
var menu = false
var ts = false

export(String) var morosurl

# animation

func _ready():
	$img/ani.play("start")
	global.morosurl = morosurl
	var dir = Directory.new()
	var testing = OS.get_executable_path().get_base_dir() + "/testing"
	var testingnoob = OS.get_executable_path().get_base_dir() + "/testing.txt"
	if dir.file_exists(testing) or dir.file_exists(testingnoob):
		global.testing = true

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if dani == false:
				$img/ani.play("skip")
			if dani == true:
				if menu == false:
					if not $img/settings.pressed == true:
						if $img/settings.pressed == false:
							$img/fx.play("fadeout")

	else:
		if event is InputEventKey and event.pressed:
			if event.scancode != KEY_ENTER:
				if dani == false:
					$img/ani.play("skip")
				if dani == true:
					if menu == false:
							if not $img/settings.pressed:
								$img/fx.play("fadeout")

# warning-ignore:unused_argument
func _on_ani_animation_finished(anim_name):
	dani = true
	$img/ani.play("pstart")


# warning-ignore:unused_argument
func _on_fx_animation_finished(anim_name):
# warning-ignore:return_value_discarded
	if ts == false:
		get_tree().change_scene("res://src/sc/sc.tscn")
	else:
		if ts == true:
			pass


func _on_Play_mouse_entered():
	$img/ani.play("growplay")


func _on_Play_mouse_exited():
	$img/ani.play_backwards("growplay")


func _on_Settings_mouse_entered():
	$img/ani.play("growsettings")


func _on_Settings_mouse_exited():
	$img/ani.play_backwards("growsettings")


func _on_Quit_mouse_entered():
	$img/ani.play("growquit")


func _on_Quit_mouse_exited():
	$img/ani.play_backwards("growquit")


func _on_Play_pressed():
	$img/fx.play("fadeout")


func _on_settings_pressed():
	$img/settings.pressed = true
	ts = true

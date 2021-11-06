extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var os = OS.get_name()
var beta = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$overlay/fade.play("fadein")
	if os == "HTML5":
		$usr/testlabel.show()
	else:
		if beta == true:
			_on_CheckButton_toggled(true)
			$usr/testlabel.hide()
		else:
			$usr/testlabel.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ben_Ben():
	global.car = "1"
	global.carname = "Ben"
	global.cartex = preload("res://src/level1-main/player/ben.tres")


func _on_Ben_Ben_Hovered():
	$img/AnimatedSprite.animation = "1"
	$img/Name.text = "Ben"


func _on_Ben_Ben_Not_Hovered():
	$img/AnimatedSprite.animation = global.car
	$img/Name.text = global.carname

func _on_Snow_Snow():
	global.car = "2"
	global.carname = "Snow"


func _on_Snow_Snow_Hovered():
	$img/AnimatedSprite.animation = "2"
	$img/Name.text = "Snow"


func _on_Snow_Snow_Not_Hovered():
	$img/AnimatedSprite.animation = global.car
	$img/Name.text = global.carname

func _on_Teddy_Teddy():
	global.car = "3"
	global.carname = "Teddy"
	global.cartex = preload("res://src/level1-main/player/teddy.tres")


func _on_Teddy_Teddy_Hovered():
	$img/AnimatedSprite.animation = "3"
	$img/Name.text = "Teddy"


func _on_Teddy_Teddy_Not_Hovered():
	$img/AnimatedSprite.animation = global.car
	$img/Name.text = global.carname

func _on_Max_Max():
	global.car = "4"
	global.carname = "Max"


func _on_Max_Max_Hovered():
	$img/AnimatedSprite.animation = "4"
	$img/Name.text = "Max"


func _on_Max_Max_Not_Hovered():
	$img/AnimatedSprite.animation = global.car
	$img/Name.text = global.carname


func _on_Continue_pressed():
	$overlay/fade.play("fadeout")


func _on_fade_animation_finished(anim_name):
	if anim_name == "fadeout":
		get_tree().change_scene("res://cs.tscn")

func _on_CheckButton_toggled(button_pressed):
	if button_pressed == true:
		$usr/Teddy/Teddy.testing = true
		$usr/Teddy/Lock.hide()
	else:
		$usr/Teddy/Teddy.testing = false
		$usr/Teddy/Lock.show()

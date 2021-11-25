extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(bool) var moving = false
export(Vector2) var moving_speed

export(Vector2) var ap

var baga = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer/Animation1.hide()
	$AnimationPlayer/Animation1/playercollison.disabled = true
	$AnimationPlayer/NPC1/npccollison.disabled = true
	$AnimationPlayer/speak.hide()
	if OS.get_name() == "Android" or OS.get_name() == "iOS":
		$player/Camera2D/mobile.show()
		global.m = true
	else:
		$player/Camera2D/mobile.hide()
		global.m = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if moving:
		if not OS.get_name() == "Windows":
			$player.position.x = $player.position.x + moving_speed.x*4
		else:
			$player.position.x = $player.position.x + moving_speed.x


# warning-ignore:unused_argument
func _on_npcarea_area_entered(area):
	pass



func _on_player_debug():
	print("signal recived")
	$AnimationPlayer.play("bag")


func _on_trigger1_body_entered(body):
	if baga == false:
		if body.name == "player":
			baga = true
			$AnimationPlayer.play("bag")


# warning-ignore:unused_argument
func _on_AnimationPlayer_animation_started(anim_name):
	$AnimationPlayer/Animation1.show()
	$AnimationPlayer/Animation1/playercollison.disabled = false
	$AnimationPlayer/NPC1/npccollison.disabled = false
	$player/Camera2D.current = false
	$AnimationPlayer/Camera2D.current = true

# warning-ignore:unused_argument
func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer/Animation1/playercollison.disabled = true
	$AnimationPlayer/NPC1/npccollison.disabled = true
	$player.csbag()
	$player.position = ap
	$player.show()
	$player/Camera2D.current = true
	$AnimationPlayer/Camera2D.current = false
	


func _on_trigger2_body_entered(body):
	if body.name == "player":
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://src/level2-main/level2.tscn")


func _on_solid_body_entered(body):
	if body.name == "player":
		moving = false

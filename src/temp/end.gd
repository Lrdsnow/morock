extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("END!")
	if OS.get_name() == "HTML5":
		$Label2.text = "You May Now Close This Tab"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play("blink")
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode != KEY_ENTER:
			get_tree().quit()

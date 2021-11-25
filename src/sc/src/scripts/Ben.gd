extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(StreamTexture) var normal
export(StreamTexture) var hovered
export(StreamTexture) var pressed

signal Ben
signal Ben_Hovered
signal Ben_Not_Hovered

var p = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_texture(normal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Ben_mouse_entered():
	set_texture(hovered)
	emit_signal("Ben_Hovered")

func _on_Ben_mouse_exited():
	set_texture(normal)
	emit_signal("Ben_Not_Hovered")


# warning-ignore:unused_argument
func _on_Ben_gui_input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		set_texture(pressed)
		emit_signal("Ben")
		p = true
	if Input.is_mouse_button_pressed(BUTTON_LEFT) == false:
		if p == true:
			set_texture(normal)
			p = false

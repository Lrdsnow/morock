extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(bool) var st

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if st == true:
		$speak/text.text = global.carname + ", And You Are?"

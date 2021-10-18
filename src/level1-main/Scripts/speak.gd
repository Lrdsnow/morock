extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(bool) var AnimationActive
export(bool) var BagActive
export(Texture) var Ben
export(Texture) var Bag
export(Vector2) var BenSize
export(Vector2) var BagSize
export(String) var text



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	if BagActive == true:
		csbag()
	else:
		if BagActive == false:
			csben()

func csbag():
	$ch.texture = Bag
	$ch.scale = BagSize

func csben():
	$ch.texture = Ben
	$ch.scale = BenSize

func _on_AnimationPlayer_animation_started(anim_name):
	while AnimationActive == true:
		$text.text = text
		if BagActive == true:
			csbag()
		else:
			if BagActive == false:
				csben()

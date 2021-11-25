extends KinematicBody2D


export(SpriteFrames) var Ben
export(SpriteFrames) var Bag
export(Vector2) var BagSize
export(Vector2) var BenSize


func _ready():
	csbag()

func csbag():
	$npccollison.shape.extents = BagSize
	$npcbody.frames = Bag

func csben():
	$npccollison.shape.extents = BenSize
	$npcbody.frames = Ben
